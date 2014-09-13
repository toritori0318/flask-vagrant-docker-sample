#!/bin/sh
set -x

# replace
sed -i "s/<python_app_placeholder>/${APP_PORT_5000_TCP_ADDR}:5000/" /etc/nginx/sites-available/default

# start
nginx
