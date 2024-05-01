#!/bin/bash
set -o xtrace

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
export DOMAIN=les-cordeiro.fr
export EMAIL=jeanpierre.cordeiro@gmail.com

kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.11.0/cert-manager.yaml
watch kubectl get pods --namespace cert-manager

cat letsencrypt-prod.yaml | envsubst | kubectl apply -f -
cat traefik-https-redirect-middleware.yaml | envsubst | kubectl apply -f -
cat whoami-ingress-tls.yaml | envsubst | kubectl apply -f -

watch kubectl get pods -A 
