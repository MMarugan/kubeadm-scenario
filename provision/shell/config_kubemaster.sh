#!/bin/bash

TempFolder="/vagrant/tmp-scripts"
JoinCommand="${TempFolder}/join-command.sh"

mkdir -p ${TempFolder}

#For flannel deploy
kubeadm init --apiserver-advertise-address 192.168.33.2 --pod-network-cidr=10.244.0.0/16

mkdir -p $HOME/.kube
cp -vf /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.10.0/Documentation/kube-flannel.yml

# 'token list' doesn't provide token hash, we have re-issue a new token to
# capture the hash -- See https://github.com/kubernetes/kubeadm/issues/519
kubeadm token create --print-join-command > "${JoinCommand}"
