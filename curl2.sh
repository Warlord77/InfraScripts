#!/bin/bash
set -B                 
for i in {1..10}; do
    curl -Is 'http://172.16.0.240:8080/core/healthcheck/ -L '
    #curl -Is http://172.16.0.240:8080/core/healthcheck/ -L
done
