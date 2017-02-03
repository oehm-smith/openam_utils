#!/usr/bin/env bash

curl -s --request POST --user GnssSiteManager:gumby123 --data "grant_type=password&username=user1&password=gumby123&scope=openid profile" http://localhost:8083/openam/oauth2/access_token?realm=/ | jq .id_token | tr -d '"' | cut -d"." -f2 | base64 -d
