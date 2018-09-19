#!/bin/bash

#It avoids dpkg-reconfigure using stdin
export DEBIAN_FRONTEND=noninteractive

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - 2>&1 >/dev/null
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get update &&
apt-get install -qy kubelet kubeadm kubectl

swapoff -a
