FROM python:3.13-slim as builder

RUN apt update && apt install -y --no-install-recommends cargo && rm -rf /var/lib/apt/lists/* && \
    pip install yantrikdb-mcp


FROM python:3.13-slim

COPY --from=builder /usr/local/lib/python3.13/site-packages /usr/local/lib/python3.13/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin

ENV HF_ENDPOINT=https://hf-mirror.com

ENV YANTRIKDB_DB_PATH=/data/memory.db
VOLUME ["/data"]

EXPOSE 8420

ENTRYPOINT ["yantrikdb-mcp"]
CMD ["--transport", "streamable-http", "--port", "8420"]
