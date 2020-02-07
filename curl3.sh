#!/bin/bash
set -e
for i in {1..10}; do
URL="http://172.16.0.240:8080/core/healthcheck/"
HTTP_RESPONSE=$(curl --silent --write-out "HTTPSTATUS:%{http_code}"  $URL)
HTTP_STATUS=$(echo $HTTP_RESPONSE | tr -d '\n' | sed -e 's/.*HTTPSTATUS://')
if [  "$HTTP_STATUS"="200" ]; then
     echo "server up";
  else
     echo "no response server"
fi
done
