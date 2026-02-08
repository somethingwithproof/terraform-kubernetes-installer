#!/bin/bash

# SECURITY: This endpoint serves kubeadm tokens.
# Access MUST be restricted via nginx mTLS client certificate verification
# and IP-based ACLs. See nginx.conf for access controls.

printf "Content-type: text/plain\n\n"


## Send response for kubeadm token
#
kubeadm token list|grep "<never>"|cut -f1 -d" "

