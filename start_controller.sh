#!/bin/bash

# Start the controller
docker run --name unifi-controller \
    -p 3478:3478/udp \
    -p 8000:8443 \
    -p 10001:10001 \
    -p 1900:1900/udp \
    -p 8080:8080 \
    -p 6789:6789 \
    --privileged \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    --restart=always \
    -d andersballegaard/unifi-sdn-controller
