FROM debian:bullseye

RUN apt-get update && apt-get install -y curl unzip openssl ca-certificates && apt-get clean

WORKDIR /app

# نصب V2Ray
RUN curl -L -o v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip v2ray.zip -d /app/v2ray && \
    rm v2ray.zip

# کپی فایل‌های کانفیگ و اسکریپت اجرا
COPY main.sh /app/main.sh
COPY config.json /app/config.json

RUN chmod +x /app/main.sh

CMD ["/app/main.sh"]
