#!/usr/bin/env bash
# mise 一键安装 + 国内镜像配置脚本
# 用法： bash install-mise-cn.sh
set -euo pipefail

# ============ 颜色输出 ============
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; BLUE='\033[0;34m'; NC='\033[0m'
info()  { echo -e "${GREEN}[INFO]${NC}  $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC}  $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*"; }

# ============ 1. 安装 mise ============
install_mise() {
    if command -v mise &>/dev/null; then
        warn "mise 已安装：$(mise --version)，跳过安装步骤"
        return 0
    fi

    info "开始安装 mise ..."
    # 使用官方安装脚本（脚本本身较小，几秒钟即可完成）
    if ! curl -fsSL https://mise.run | bash; then
        error "mise 安装失败，请检查网络后重试"
        exit 1
    fi

    # 让当前 shell 能找到 mise
    export PATH="$HOME/.local/bin:$PATH"
    hash -r 2>/dev/null || true

    if ! command -v mise &>/dev/null; then
        error "mise 安装后仍无法在 PATH 中找到，请手动检查 $HOME/.local/bin"
        exit 1
    fi
    info "mise 安装完成：$(mise --version)"
}

# ============ 2. 写入 shell 激活代码 ============
configure_shell() {
    info "配置 shell 激活代码 ..."
    local rc_file
    case "${SHELL:-/bin/bash}" in
        */zsh)  rc_file="$HOME/.zshrc" ;;
        */bash) rc_file="$HOME/.bashrc" ;;
        *)      rc_file="$HOME/.profile" ;;
    esac
    touch "$rc_file"

    if ! grep -q 'mise activate' "$rc_file"; then
        {
            echo ''
            echo '# >>> mise activate >>>'
            echo 'export PATH="$HOME/.local/bin:$PATH"'
            case "${SHELL:-/bin/bash}" in
                */zsh) echo 'eval "$(mise activate zsh)"' ;;
                *)     echo 'eval "$(mise activate bash)"' ;;
            esac
            echo '# <<< mise activate <<<'
        } >> "$rc_file"
        info "已写入 mise 激活代码到 $rc_file"
    else
        warn "$rc_file 中已存在 mise 激活代码，跳过"
    fi
}

# ============ 3. 配置 mise 各语言下载镜像 ============
configure_mise_mirrors() {
    info "配置 mise 下载镜像 ..."

    # Node.js 二进制下载镜像（淘宝 / npmmirror）
    mise settings set node.mirror_url "https://npmmirror.com/mirrors/node" 2>/dev/null \
        || warn "设置 node.mirror_url 失败"

    # Python 源码下载镜像（华为云）
    mise settings set python.build.mirror_url "https://mirrors.huaweicloud.com/python/" 2>/dev/null \
        || warn "设置 python.build.mirror_url 失败"

    # Ruby 源码镜像（清华）
    mise settings set ruby.mirror_url "https://cache.ruby-china.com/" 2>/dev/null \
        || warn "设置 ruby.mirror_url 失败"

    # Go 源码镜像（golang.google.cn）
    mise settings set go.mirror_url "https://golang.google.cn/dl/" 2>/dev/null \
        || warn "设置 go.mirror_url 失败"

    # Rust rustup 镜像（清华）—— 通过环境变量
    mise settings set env.RUSTUP_DIST_SERVER "https://mirrors.tuna.tsinghua.edu.cn/rustup" 2>/dev/null \
        || warn "设置 RUSTUP_DIST_SERVER 失败"
    mise settings set env.RUSTUP_UPDATE_ROOT "https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup-dist" 2>/dev/null \
        || warn "设置 RUSTUP_UPDATE_ROOT 失败"

    # Go GOPROXY
    mise settings set env.GOPROXY "https://goproxy.cn,direct" 2>/dev/null \
        || warn "设置 GOPROXY 失败"

    # pip 镜像
    mise settings set env.PIP_INDEX_URL "https://mirrors.aliyun.com/pypi/simple/" 2>/dev/null \
        || warn "设置 PIP_INDEX_URL 失败"
    mise settings set env.PIP_TRUSTED_HOST "mirrors.aliyun.com" 2>/dev/null \
        || warn "设置 PIP_TRUSTED_HOST 失败"

    info "mise 镜像配置完成"
}

# ============ 4. 配置各包管理器镜像 ============
configure_package_managers() {
    info "配置各语言包管理器镜像 ..."

    # ---------- npm ----------
    mkdir -p "$HOME/.npm"
    cat > "$HOME/.npmrc" <<'EOF'
registry=https://registry.npmmirror.com
disturl=https://npmmirror.com/mirrors/node
chromedriver_cdnurl=https://npmmirror.com/mirrors/chromedriver
operadriver_cdnurl=https://npmmirror.com/mirrors/operadriver
phantomjs_cdnurl=https://npmmirror.com/mirrors/phantomjs
fse_binary_host_mirror=https://npmmirror.com/mirrors/fsevents
sass_binary_site=https://npmmirror.com/mirrors/node-sass
electron_mirror=https://npmmirror.com/mirrors/electron/
node_inspector_cdnurl=https://npmmirror.com/mirrors/node-inspector
puppeteer_download_host=https://npmmirror.com/mirrors
EOF
    info "npm 镜像已写入 ~/.npmrc"

    # ---------- pip ----------
    mkdir -p "$HOME/.pip" "$HOME/.config/pip"
    cat > "$HOME/.pip/pip.conf" <<'EOF'
[global]
index-url = https://mirrors.aliyun.com/pypi/simple/
[install]
trusted-host = mirrors.aliyun.com
EOF
    cp "$HOME/.pip/pip.conf" "$HOME/.config/pip/pip.conf"
    info "pip 镜像已写入 ~/.pip/pip.conf 和 ~/.config/pip/pip.conf"

    # ---------- Go (GOPROXY) ----------
    # 通过 mise env 已设置 GOPROXY；这里再通过 go env 兜底（若 go 已安装）
    if command -v go &>/dev/null; then
        go env -w GOPROXY=https://goproxy.cn,direct
        go env -w GO111MODULE=on
        info "Go env 已设置 GOPROXY"
    else
        info "Go 尚未安装，GOPROXY 已通过 mise env 配置"
    fi

    # ---------- Rust / Cargo ----------
    mkdir -p "$HOME/.cargo"
    cat > "$HOME/.cargo/config.toml" <<'EOF'
[source.crates-io]
replace-with = 'ustc'

[source.ustc]
registry = "sparse+https://mirrors.ustc.edu.cn/crates.io-index/"

[net]
git-fetch-with-cli = true
EOF
    info "Cargo (Rust) 镜像已写入 ~/.cargo/config.toml"

    # ---------- Ruby / Gem ----------
    mkdir -p "$HOME/.gem"
    cat > "$HOME/.gemrc" <<'EOF'
---
:backtrace: false
:bulk_threshold: 1000
:sources:
- https://gems.ruby-china.com/
:update_sources: true
:verbose: true
EOF
    info "Ruby gem 镜像已写入 ~/.gemrc"

    # ---------- Maven ----------
    mkdir -p "$HOME/.m2"
    cat > "$HOME/.m2/settings.xml" <<'EOF'
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                              https://maven.apache.org/xsd/settings-1.0.0.xsd">
  <mirrors>
    <mirror>
      <id>aliyun-public</id>
      <name>Aliyun Public</name>
      <url>https://maven.aliyun.com/repository/public</url>
      <mirrorOf>central</mirrorOf>
    </mirror>
    <mirror>
      <id>aliyun-spring</id>
      <name>Aliyun Spring</name>
      <url>https://maven.aliyun.com/repository/spring</url>
      <mirrorOf>spring</mirrorOf>
    </mirror>
    <mirror>
      <id>aliyun-google</id>
      <name>Aliyun Google</name>
      <url>https://maven.aliyun.com/repository/google</url>
      <mirrorOf>google</mirrorOf>
    </mirror>
    <mirror>
      <id>aliyun-gradle-plugin</id>
      <name>Aliyun Gradle Plugin</name>
      <url>https://maven.aliyun.com/repository/gradle-plugin</url>
      <mirrorOf>gradle-plugin</mirrorOf>
    </mirror>
  </mirrors>
</settings>
EOF
    info "Maven 镜像已写入 ~/.m2/settings.xml"

    # ---------- Gradle ----------
    mkdir -p "$HOME/.gradle/init.d"
    cat > "$HOME/.gradle/init.d/init-mirrors.gradle" <<'EOF'
allprojects {
    repositories {
        def ALIYUN_PUBLIC    = 'https://maven.aliyun.com/repository/public'
        def ALIYUN_JCENTER   = 'https://maven.aliyun.com/repository/jcenter'
        def ALIYUN_GOOGLE    = 'https://maven.aliyun.com/repository/google'
        def ALIYUN_GRADLE    = 'https://maven.aliyun.com/repository/gradle-plugin'
        all { ArtifactRepository repo ->
            if (repo instanceof MavenArtifactRepository) {
                def url = repo.url.toString()
                if (url.startsWith('https://repo1.maven.org/maven2') ||
                    url.startsWith('https://repo.maven.apache.org/maven2')) {
                    remove repo
                }
                if (url.startsWith('https://jcenter.bintray.com/')) { remove repo }
                if (url.startsWith('https://dl.google.com/dl/android/maven2/')) { remove repo }
                if (url.startsWith('https://plugins.gradle.org/m2/')) { remove repo }
            }
        }
        maven { url ALIYUN_PUBLIC }
        maven { url ALIYUN_JCENTER }
        maven { url ALIYUN_GOOGLE }
        maven { url ALIYUN_GRADLE }
    }
}
EOF
    info "Gradle 镜像已写入 ~/.gradle/init.d/init-mirrors.gradle"

    # ---------- PHP / Composer ----------
    mkdir -p "$HOME/.composer"
    cat > "$HOME/.composer/config.json" <<'EOF'
{
    "config": {},
    "repositories": {
        "packagist": {
            "type": "composer",
            "url": "https://mirrors.aliyun.com/composer/"
        }
    }
}
EOF
    info "Composer (PHP) 镜像已写入 ~/.composer/config.json"

    # ---------- Rustup 镜像兜底（写到 shell rc）----------
    local rc_file
    case "${SHELL:-/bin/bash}" in
        */zsh)  rc_file="$HOME/.zshrc" ;;
        */bash) rc_file="$HOME/.bashrc" ;;
        *)      rc_file="$HOME/.profile" ;;
    esac
    if ! grep -q '# >>> China mirrors >>>' "$rc_file" 2>/dev/null; then
        cat >> "$rc_file" <<'EOF'

# >>> China mirrors >>>
export RUSTUP_DIST_SERVER="https://mirrors.tuna.tsinghua.edu.cn/rustup"
export RUSTUP_UPDATE_ROOT="https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup-dist"
export GOPROXY="https://goproxy.cn,direct"
export GO111MODULE="on"
export PIP_INDEX_URL="https://mirrors.aliyun.com/pypi/simple/"
export PIP_TRUSTED_HOST="mirrors.aliyun.com"
export COMPOSER_PACKAGIST_MIRROR="https://mirrors.aliyun.com/composer/"
# <<< China mirrors <<<
EOF
        info "国内镜像环境变量已写入 $rc_file"
    fi
}

# ============ 5. 主流程 ============
main() {
    echo -e "${BLUE}================================================${NC}"
    echo -e "${BLUE}  mise 一键安装 + 国内镜像配置${NC}"
    echo -e "${BLUE}================================================${NC}"

    install_mise
    configure_shell
    configure_mise_mirrors
    configure_package_managers

    echo ""
    echo -e "${GREEN}================================================${NC}"
    echo -e "${GREEN}  ✅ 全部完成！${NC}"
    echo -e "${GREEN}================================================${NC}"
    echo ""
    echo "请执行下面命令让配置生效："
    echo -e "  ${YELLOW}source ~/.zshrc${NC}   # 或 source ~/.bashrc"
    echo ""
    echo "常用命令："
    echo "  mise install node@20         # 会自动从 npmmirror 下载 Node.js"
    echo "  mise use --global node@20"
    echo "  mise install python@3.12     # 会自动从华为云下载 Python"
    echo "  mise install go@1.22"
    echo "  mise install rust@1.78"
    echo "  mise ls                      # 查看已安装版本"
    echo ""
    echo -e "${GREEN}验证 npm 镜像：${NC} npm config get registry"
    echo -e "${GREEN}验证 pip 镜像：${NC} pip config list"
    echo -e "${GREEN}验证 go 代理：${NC} go env GOPROXY"
}

main "$@"
