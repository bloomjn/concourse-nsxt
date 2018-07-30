#!/bin/bash

# EDIT names and domain
CONCOURSE_ENDPOINT=fly.vballin.com:8080
CONCOURSE_TARGET=nsx-concourse
PIPELINE_NAME=install-nsx-t

alias fly-s="fly -t $CONCOURSE_TARGET set-pipeline -p $PIPELINE_NAME -c pipelines/nsx-t-install.yml -l nsx-t-params.yml"
alias fly-l="fly -t $CONCOURSE_TARGET containers | grep $PIPELINE_NAME"
alias fly-h="fly -t $CONCOURSE_TARGET hijack -b "

echo "Concourse target set to $CONCOURSE_ENDPOINT"
echo "Login using fly"
echo ""

fly --target $CONCOURSE_TARGET login --insecure --concourse-url http://${CONCOURSE_ENDPOINT} -n main