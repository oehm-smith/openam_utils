#!/usr/bin/env bash

docker run --name nginx -v /home/brooke/www:/usr/share/nginx/html:ro -p 88:80 nginx

