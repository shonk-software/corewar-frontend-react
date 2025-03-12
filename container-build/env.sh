#!/bin/sh
key="COREWAR_BACKEND_URL_PLACEHOLDER"
value=$COREWAR_BACKEND_URL

if [ -z "$value" ]; then
  echo "COREWAR_BACKEND_URL is not set"
  exit 1
fi

mkdir /serve
cp -r /usr/share/nginx/html/* /serve
cp -r /usr/share/nginx/html/.* /serve

echo $key=$value
find /serve -type f \( -name '*.js' -o -name '*.css' \) -exec sed -i "s|${key}|${value}|g" '{}' +
