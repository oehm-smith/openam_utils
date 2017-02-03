#!/usr/bin/env bash

TOKEN="AQIC5wM2LY4SfcyeomzLJpSUVpYHf38QVwe3eb0PG7fbNbY.*AAJTSQACMDEAAlNLABM4NDE5NjAyMTk2MDIzNjM3MzQ1AAJTMQAA*"

curl -v -H "Cookie: iPlanetDirectoryPro=$TOKEN" http://localhost:8084/openam/json/users/brooke?_fields=isMemberOf

#curl -v -H "Cookie: iPlanetDirectoryPro=AQIC5wM2LY4SfczABVOMfPVDJVQ4uW11erHNhwOyWugy3JM.*AAJTSQACMDEAAlNLABIyOTgwMDYxMTQ5ODY4ODA5OTAAAlMxAAA.*" http://localhost:8084/openam/json/users/brooke/groups
