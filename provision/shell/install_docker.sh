#!/bin/bash

#It avoids dpkg-reconfigure using stdin
export DEBIAN_FRONTEND=noninteractive

curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - 2>&1 >/dev/null

add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/debian/
$(lsb_release -cs)
stable"

apt-get update &&
declare -r DOCKER_VERSION_CERTIFIED="17.03.3"
apt-get install -qy docker-ce="${DOCKER_VERSION_CERTIFIED}~ce-0~debian-stretch"
