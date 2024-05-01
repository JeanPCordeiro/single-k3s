#!/bin/bash
set -o xtrace

curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.28.3+k3s2 sh -s server \
--cluster-init \
--flannel-backend=wireguard-native \
--write-kubeconfig-mode 644
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
cat traefik-config.yaml | envsubst | kubectl apply -f -

source <(kubectl completion bash) # set up autocomplete in bash into the current shell, bash-completion package should be installed first.
echo "source <(kubectl completion bash)" >> ~/.bashrc # add autocomplete permanently to your bash shell.

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

watch kubectl get pods -A
