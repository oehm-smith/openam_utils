#!/usr/bin/env bash

REALM=/

DEBUG=true

USER=$1
if [ -z $USER ]; then
	USER='test';
fi
	
PW=$2
if [ -z $PW ]; then
	PW='testtest';
fi

echo USER:$USER.
echo PW:$PW.

if [ -z $USER ]; then
	exit 1;
fi

CURLCALL="curl http://localhost:8083/openam/identity/isTokenValid?tokenid=AQIC5wM2LY4RfckcedfzxGrgVYevbKR-SgBkuemF4Cmm5Qg.*AAJTSQABMDE.*"

if [ "$DEBUG" = true ]; then
	echo CURL CALL: $CURLCALL
fi
#CURLOUT=$(curl -s --request POST --user GnssSiteManager:gumby123 --data "grant_type=password&username=$USER&password=$PW&scope=openid profile" http://localhost:8083/openam/oauth2/access_token?realm=$REALM)
CURLOUT=$($CURLCALL)
if [ "$DEBUG" = true ]; then
	echo CURL OUT: $CURLOUT
fi

echo $CURLOUT | jq .id_token | tr -d '"' | cut -d"." -f2 | base64 -d
