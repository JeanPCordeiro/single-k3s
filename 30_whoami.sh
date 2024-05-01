#!/bin/bash
set -o xtrace


export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
export DOMAIN=les-cordeiro.fr
export EMAIL=jeanpierre.cordeiro@gmail.com

kubectl apply -f whoami-deployment.yaml 
kubectl apply -f whoami-service.yaml

watch kubectl get pods -A
