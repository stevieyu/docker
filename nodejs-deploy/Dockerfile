# 1. 构建基础镜像
FROM alpine AS base

# 设置环境变量
ENV NODE_ENV=production
ENV APP_PATH=/app

# 设置工作目录
WORKDIR $APP_PATH

# 安装 nodejs 和 yarn
RUN apk add --no-cache --update nodejs=16

# -------------------------------
# 2. 使用基础镜像 装依赖阶段
FROM base AS install

# 拷贝 package.json 到工作跟目录下
COPY package.json ./

# 安装依赖
RUN npm install

# ----------------------------------------
# 3. 最终阶段，也就是输出的镜像是这个阶段构建的，前面的阶段都是为这个阶段做铺垫
FROM base

# 拷贝 装依赖阶段 生成的 node_modules 文件夹到工作目录下
COPY --from=install $APP_PATH/node_modules ./node_modules

# 将当前目录下的所有文件（除了.dockerignore排除的路径），都拷贝进入镜像的工作目录下
COPY . .

# 启动
CMD npm start
