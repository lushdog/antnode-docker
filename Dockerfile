FROM debian:bullseye-slim

RUN apt update && apt install -y wget unzip ca-certificates && rm -rf /var/lib/apt/lists/* 

# 设置工作目录
WORKDIR /app

RUN wget https://github.com/maidsafe/autonomi/releases/download/stable-2025.1.2.3/2025.1.2.3.autonomi.x86_64-unknown-linux-musl.zip \
    && unzip 2025.1.2.3.autonomi.x86_64-unknown-linux-musl.zip \
    && mv 2025.1.2.3.autonomi.x86_64-unknown-linux-musl/antnode . \
    && chmod +x antnode \
    && rm -rf 2025.1.2.3.autonomi.x86_64-unknown-linux-musl

COPY entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh

# 设置默认命令
ENTRYPOINT ["./entrypoint.sh"]