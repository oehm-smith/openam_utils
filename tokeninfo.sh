#!/usr/bin/env bash
TOKEN=$1

#QIC5wM2LY4SfcwF2WJ6HRtXzSMmD7ndAslW5sVhhjUq_q4

REALM=/

DEBUG=true
#SCOPE=cn
SCOPE="openid profile"
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

CURLCALL='curl http://localhost:8083/openam/oauth2/tokeninfo?access_token=$TOKEN'

if [ "$DEBUG" = true ]; then
	echo CURL CALL: $CURLCALL
fi
CURLOUT=$($CURLCALL)

if [ "$DEBUG" = true ]; then
	echo CURL OUT: $CURLOUT
	echo
fi

echo $CURLOUT | jq .id_token | tr -d '"' | cut -d"." -f2 | base64 -d
