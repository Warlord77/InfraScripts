#!/bin/bash
set -ex
for i in {1..10}; do
  a=$(curl -Is http://172.16.0.246:8080/core/healthcheck/ -L | grep 200)
  if   [[  -z $a ]]; then
     echo "no response server"
  elif [  "$a"="HTTP/1.1 200 OK" ]; then  
     echo "server up";   
  else
     echo "no response server"
  fi
done
