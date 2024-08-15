FROM jetpackio/devbox

RUN sudo apt update && sudo apt install -y curl && \
    curl -fsSL https://code-server.dev/install.sh | sh && \
    chmod -R a+rw /home/devbox/.local/share && \
    code-server --install-extension MS-CEINTL.vscode-language-pack-zh-hans

RUN sudo mkdir -p /workspace && \
    sudo chmod a+rw /workspace && \
    cd /workspace && \
    devbox init && devbox run date

RUN mkdir -p /home/devbox/.local/share/code-server/User
ADD settings.json /home/devbox/.local/share/code-server/User/settings.json

EXPOSE 8080

CMD code-server --bind-addr 0.0.0.0:8080 --locale zh --auth none /workspace
