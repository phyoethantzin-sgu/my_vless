#!/bin/bash
PORT="${PORT:-10000}"
UUID="${UUID:-b831381d-6324-4d53-ad4f-8cda98b3f811}"

cat <<EOF > /root/config.json
{
  "log": { "loglevel": "warning" },
  "inbounds": [
    {
      "port": $PORT,
      "protocol": "vless",
      "settings": {
        "clients": [ { "id": "$UUID", "flow": "" } ],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "ws",
        "wsSettings": { "path": "/" }
      }
    }
  ],
  "outbounds": [ { "protocol": "freedom" } ]
}
EOF

echo "Starting Xray on port $PORT..."
/root/xray -config /root/config.json
