#!/bin/bash

# EDIT name and domain
CONCOURSE_ENDPOINT=fly.vballin.com:8080
CONCOURSE_TARGET=nsx-concourse
PIPELINE_NAME=install-pks-with-nsx
UPGRADE_PIPELINE=upgrade-pks
CONCOURSE_USER=nsx
CONCOURSE_PW=vmware

alias fly-s="fly -t $CONCOURSE_TARGET set-pipeline -p $PIPELINE_NAME -c ../nsx-t-ci-pipeline/pipelines/install-pks-pipeline.yml -l ../nsx-t-ci-pipeline/pipelines/pks-params.yml"
alias fly-l="fly -t $CONCOURSE_TARGET containers | grep $PIPELINE_NAME"
alias fly-h="fly -t $CONCOURSE_TARGET hijack -b "
alias fly-u="fly -t $CONCOURSE_TARGET set-pipeline -p $UPGRADE_PIPELINE -c pks-upgrade/upgrade-pipeline.yml -l pks-upgrade/upgrade-params.yml"

echo "Concourse target set to $CONCOURSE_ENDPOINT"
echo "Login using fly"
echo ""

fly --target $CONCOURSE_TARGET login -u $CONCOURSE_USER -p $CONCOURSE_PW --concourse-url http://${CONCOURSE_ENDPOINT} -n main
