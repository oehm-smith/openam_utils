#!/usr/bin/env bash
TOKEN=$1

END=http://localhost:8083/openam
#QIC5wM2LY4SfcwF2WJ6HRtXzSMmD7ndAslW5sVhhjUq_q4

REALM=/

DEBUG=false
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

#echo USER:$USER.
#echo PW:$PW.

if [ -z $USER ]; then
	exit 1;
fi

#CURLCALL='curl http://localhost:8083/openam/oauth2/tokeninfo?access_token=$TOKEN'
CURLCALL=(--request POST -H "Authorization: Bearer $TOKEN" -d "" -ks "$END"/oauth2/userinfo)	# | jq .roles'

if [ "$DEBUG" = true ]; then
	echo "${CURLCALL[@]}"
fi
#CURLOUT=$($CURLCALL)
CURLOUT=$(curl "${CURLCALL[@]}")

if [ "$DEBUG" = true ]; then
	echo $CURLOUT
	echo
fi

echo $CURLOUT 
#echo $CURLOUT | jq .id_token | tr -d '"' | cut -d"." -f2 | base64 -d
