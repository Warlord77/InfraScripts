#!/bin/bash
set -ex
for i in {1..10}; do
  a=$(curl -Is http://<$backend_ip>/core/healthcheck/ -L | grep 200)
  if   [[  -z $a ]]; then
     echo "no response server"
  elif [  "$a"="HTTP/1.1 200 OK" ]; then  
     echo "server up";   
  else
     echo "no response server"
  fi
done
