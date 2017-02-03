#!/usr/bin/env bash

ADDR=localhost:8083

curl \
	 --request POST \
	  --header "X-OpenAM-Username: user1" \
	   --header "X-OpenAM-Password: gumby123" \
	    --header "Content-Type: application/json" \
	     --data "{}" \
http://$ADDR/openam/json/authenticate

