FROM debian:bullseye-slim

RUN apt update && apt install -y wget unzip ca-certificates && rm -rf /var/lib/apt/lists/* 

# 设置工作目录
WORKDIR /app

ARG VERSION=2025.1.2.3

RUN wget https://github.com/maidsafe/autonomi/releases/download/stable-${VERSION}/${VERSION}.autonomi.x86_64-unknown-linux-musl.zip \
    && unzip -d ./temp ${VERSION}.autonomi.x86_64-unknown-linux-musl.zip \
    && mv temp/antnode . \
    && chmod +x antnode \
    && rm -rf temp

COPY entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh

# 设置默认命令
ENTRYPOINT ["./entrypoint.sh"]
