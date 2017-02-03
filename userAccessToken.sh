#!/usr/bin/env bash

REALM=/

DEBUG=false
#SCOPE=cn
SCOPE="profile"	#openid
USER=$1
if [ -z $USER ]; then
	USER='test';
fi
	
PW=$2
if [ -z $PW ]; then
	PW='testtest';
fi

#echo USER:$USER.
#echo PW:$PW.

if [ -z $USER ]; then
	exit 1;
fi

CURLCALL='curl -s --request POST --user GnssSiteManager:gumby123 --data "grant_type=password&username='$USER'&password='$PW'&scope='$SCOPE'" http://localhost:8083/openam/oauth2/access_token?realm='$REALM

if [ "$DEBUG" = true ]; then
	echo $CURLCALL
fi
CURLOUT=$(curl -s --request POST --user GnssSiteManager:gumby123 --data "grant_type=password&username=$USER&password=$PW&scope=$SCOPE" http://localhost:8083/openam/oauth2/access_token?realm=$REALM)

if [ "$DEBUG" = true ]; then
	echo $CURLOUT
	echo
fi

echo $CURLOUT | jq .access_token #| tr -d '"' | cut -d"." -f2 | base64 -d
