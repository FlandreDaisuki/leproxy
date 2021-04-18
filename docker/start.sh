#!/bin/sh

if [ ! -f mapping.yml ]; then
    echo "mapping.yml not found!"
    exit 1
fi

cp mapping.yml real-mapping.yml
GATEWAY_IP=$(ip route show eth0 | sed 's/.* \([0-9.]\+\) .\+$/\1/')
sed -i "s/\$GATEWAY_IP/$GATEWAY_IP/g" real-mapping.yml

./leproxy -http=:80 -addr=:443 -map=real-mapping.yml
