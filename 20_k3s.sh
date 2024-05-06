#!/bin/bash
set -o xtrace

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--tls-san 192.168.1.110" sh -s - --write-kubeconfig-mode 644

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml


source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bashrc

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

watch kubectl get pods -A
