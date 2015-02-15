#! /usr/bin/env bash

set -e

# fix ownership / permissions on /var/lib/nginx
mkdir -p -m 755 /var/lib/nginx
chown -R root:root /var/lib/nginx

exec /usr/sbin/nginx -c /etc/nginx/nginx.conf -g "daemon off;"
