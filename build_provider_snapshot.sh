#!/usr/bin/env bash

LOCAL_PLUGINS_DIR=/root/.terraform.d/plugins/
LOCAL_REGISTRY_DIR="${LOCAL_PLUGINS_DIR}/registry.terraform.io/hashicorp/aws"

goreleaser build --snapshot --single-target --clean --timeout 60m0s && \
mkdir -p "${LOCAL_PLUGINS_DIR}/registry.terraform.io/hashicorp/aws/9.9.9/linux_amd64/" && \
find ./dist/terraform-provider-aws_linux_amd64*/ -maxdepth 1 -name "terraform-provider-aws*" -type f -exec cp "{}" ${LOCAL_REGISTRY_DIR}/9.9.9/linux_amd64/terraform-provider-aws \; && \
cp local-aws-provider*.tfrc "${LOCAL_PLUGINS_DIR}/"
