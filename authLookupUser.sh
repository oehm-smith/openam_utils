#!/usr/bin/env bash
#TOKEN=$1

END=http://localhost:8083/openam
#QIC5wM2LY4SfcwF2WJ6HRtXzSMmD7ndAslW5sVhhjUq_q4

REALM=/

DEBUG=false
#SCOPE=cn
SCOPE="profile"	# openid 
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

LOOKUP=$3
if [ "$DEBUG" = true ]; then
	echo lookup: $LOOKUP
fi

CALL1=$(./userAccessToken.sh $USER $PW) #| grep "{" | jq .acces_token) #}
if [ "$DEBUG" = true ]; then
	echo call1: $CALL1
fi
TOKEN=$(echo $CALL1 | tr -d '"')
#if [ "$DEBUG" = true ]; then
	echo token: $TOKEN
#fi
CALL2=$(./userInfo.sh $TOKEN)
if [ "$DEBUG" = true ]; then
	echo result: 
fi
VAL1=$(echo $CALL2 | grep "{")
if [ -n "$LOOKUP" ]; then
	echo $VAL1 | jq .$LOOKUP
else
	echo $VAL1
fi

