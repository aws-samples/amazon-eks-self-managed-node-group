#!/bin/bash
# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

set -o xtrace
systemctl stop kubelet
/etc/eks/bootstrap.sh \
    --kubelet-extra-args '--node-labels=${join(",", [for label, value in node_labels : "${label}=${value}"])}' \
    ${cluster_name}
