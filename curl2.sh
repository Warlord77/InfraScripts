#!/bin/bash
set -B                 
for i in {1..10}; do
    curl -Is 'http://<ip>:<port>/core/healthcheck/ -L '
    #curl -Is 'http://<host_ip>/core/healthcheck/ -L 
done
