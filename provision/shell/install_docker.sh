#!/bin/bash

#It avoids dpkg-reconfigure using stdin
export DEBIAN_FRONTEND=noninteractive

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu/
$(lsb_release -cs)
stable"
apt-get update &&
apt-get install -qy docker-ce
