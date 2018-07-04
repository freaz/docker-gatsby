#!/bin/sh
set -e
export PATH=$PATH:/usr/local/bin/gatsby

if [ "$1" == "serve-nginx" ]; then
  nginx -g "daemon off;"
else
  gatsby $@
fi
