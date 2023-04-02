#!/usr/bin/env bash

set -v

cd ~/bin
KUBECONFIG=~/.kube/awx.int.demoitlab.com.KUBECONFIG
sudo kubectl -n awx create secret tls tls-awx-ingress \
  --cert=/etc/letsencrypt/live/ash.demoitlab.com/fullchain.pem \
  --key=/etc/letsencrypt/live/ash.demoitlab.com/privkey.pem \
  --dry-run=client -o yaml  --save-config  | kubectl apply -f -

