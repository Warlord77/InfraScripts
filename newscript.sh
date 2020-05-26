#!/bin/bash

set -x
for server_info in `cat servers_api.txt`
do
    common_name="$(echo $server_info | cut -d';' -f1)"
    echo "common_name"
    backend_name="$(echo $server_info | cut -d';' -f2)"
    echo "backend_name"
    backend_ip="$(echo $server_info | cut -d';' -f3)"
    echo "backend_ip"
    scp /home/$USER/productions_api.py $USER@$backend_ip:/home/awakening/production.py
    scp /home/$USER/connections.cfg $USER@$backend_ip:/home/awakening/connections.cfg
    ssh $backend_ip 'chown awakening: /home/awakening/production.py && chmod 600 /home/awakening/production.py'
    ssh $backend_ip 'chown awakening: /home/awakening/connections.cfg && chmod 600 /home/awakening/connections.cfg'
    ssh -tt $backend_ip '/home/awakening/redeploy.sh'
    sleeps 60
    echo "enable server" myaccount-plain/$backend_name
    errors=()
    for i in {1..10}; do
    statusCode=$(curl -s -o /dev/null -I -w "%{http_code}" http://172.16.0.246:8080/core/healthcheck/)
    if [[ "$statusCode" != 2* ]]; then
      #echo "Code: $statusCode"
      echo "No response from server"
      errors+=("[${statusCode}] ${line}")
    else
      echo "Server is up" 
    fi
    sleep 3
    echo "---------------"
    errorsCount=${#errors[@]}
    echo "Found $errorsCount errors."
    if (( $errorsCount > 0 )); then
       printf '%s\n' "${errors[@]}"
    fi
    done

    echo "Press enter to deploy to next server"
done
