#!/bin/sh

envsubst <"/tmp/site.conf" >"/etc/nginx/conf.d/default.conf"

exec "$@"