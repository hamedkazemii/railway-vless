#!/bin/bash
set -e

# ساخت کلید TLS
openssl req -x509 -newkey rsa:2048 -nodes -keyout /app/key.pem -out /app/cert.pem -days 365 \
  -subj "/C=US/ST=None/L=None/O=None/CN=railway.app"

# اجرای صحیح V2Ray
/app/v2ray/v2ray run -config /app/config.json
