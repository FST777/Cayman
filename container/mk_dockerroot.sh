#!/usr/bin/env sh

mkdir tmproot && cd tmproot

mkdir -p usr/local/bin usr/local/etc etc/nginx/conf.d
cp ../../cayman usr/local/bin
cp ../../cayman.conf ../../openssl.conf usr/local/etc
cp ../nginx.conf etc/nginx/conf.d

sed -i 's|^PDIR=.*$|PDIR="/usr/local/share/cayman/CA/"|' usr/local/etc/cayman.conf
sed -i 's|^CONF=.*$|CONF="/usr/local/etc/openssl.conf"|' usr/local/etc/cayman.conf
cat << EOF >> usr/local/etc/cayman.conf

# Persistent overrides can be put here:
[ -r /usr/local/share/cayman/cayman.conf ] && source /usr/local/share/cayman/cayman.conf
EOF

tar cJf ../container.txz *

cd .. && rm -rf tmproot