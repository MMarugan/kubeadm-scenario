#!/bin/bash

#It avoids dpkg-reconfigure using stdin
export DEBIAN_FRONTEND=noninteractive

apt-get update &&
apt-get install -qy ca-certificates curl software-properties-common apt-transport-https gnupg2 jq ipvsadm
