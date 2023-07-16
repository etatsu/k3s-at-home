#!/bin/bash
printf "Master IP:\n$(hostname -I | awk '{print $1}')\n\n"
# get token
echo "Token:"
cat /var/lib/rancher/k3s/server/node-token