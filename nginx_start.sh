#! /usr/bin/env bash

set -e

CONFIG_FILE=/etc/nginx/nginx.conf

# fix ownership / permissions on /var/lib/nginx
mkdir -p -m 755 /var/lib/nginx
chown -R root:root /var/lib/nginx

CONTAINER_PORT=${CONTAINER_PORT:-8000}

if [ "$(env | grep -m 1 PORT)" ]; then
    echo "Proxying towards http://webapp:$CONTAINER_PORT"
    sed -i "s/APP_URL/webapp\:$CONTAINER_PORT/" /etc/nginx/nginx.proxy.conf
    CONFIG_FILE=/etc/nginx/nginx.proxy.conf
else
    sed -i "s/\/usr\/share\/nginx\/html/\/staticfiles/" /etc/nginx/conf.d/default.conf
fi


exec /usr/sbin/nginx -c $CONFIG_FILE -g "daemon off;"
