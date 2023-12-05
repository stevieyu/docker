FROM ubuntu:22.04 AS base

ENV LC_ALL=C.utf8

RUN apt-get update \
    && apt-get install -y wget \
    && wget https://huggingface.co/WisdomShell/CodeShell-7B-Chat-int4/resolve/main/codeshell-chat-q4_0.gguf \
    && apt-get remove -y wget \ 
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*




FROM base AS build

RUN apt-get update \
    && apt-get install -y build-essential git \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

RUN git clone --depth=1 https://github.com/WisdomShell/llama_cpp_for_codeshell.git app

WORKDIR /app

RUN make





FROM base AS runtime

COPY --from=build /app/main /
COPY --from=build /app/server /

EXPOSE 8080

CMD ./server -m codeshell-chat-q4_0.gguf -c 2048 --host 0.0.0.0 --port 8080