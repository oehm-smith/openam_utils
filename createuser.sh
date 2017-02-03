#!/usr/bin/env bash

TOKEN="AQIC5wM2LY4SfcyO_X8tXc0IMZzpvBMp5P0Gz6lhHzYur0s.*AAJTSQACMDEAAlNLABQtNjQ3MTM1ODUzODY1OTU0OTAxNgACUzEAAA..*"
URL="http://localhost:8084/openam/json/users/?_action=create"

curl \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Cookie: iplanetDirectoryPro: $TOKEN" \
  --data \
	     '{
   "username": "bjensen",
   "userpassword": "secret12",
   "mail": "bjensen@example.com"
}' \
$URL

