#!/bin/bash

# Execute a request with a JWT.

defaultUrl='http://127.0.0.1:8000'
defaultJwt='zogzog'

read -p "URL: " url
read -p "JWT: " jwt
echo -e "$url\n"

if [ -z $url ]
then
    url=$defaultUrl
fi

if [ -z $jwt ]
then
    jwt=$defaultJwt
fi

curl -H 'Accept: application/json' -H "Authorization: Bearer $jwt" $url