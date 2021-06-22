// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

# -----------------------------------------------------------------------------
# Deploy a self-managed node group on an Outpost
# -----------------------------------------------------------------------------
provider "aws" {
  region  = "us-west-2"
  profile = "aws-outposts-dev+sea19.04-Admin"
}

module "eks_self_managed_node_group" {
  source = "../.."

  eks_cluster_name = "cmluns-eks-cluster"
  instance_type    = "m5.2xlarge"
  desired_capacity = 1
  min_size         = 1
  max_size         = 1
  subnets          = ["subnet-0afb721a5cc5bd01f"] # Outposts subnet(s)

  node_labels = {
    "node.kubernetes.io/outpost"    = "op-0d4579457ff2dc345" # (Optional) Outpost ID label
    "node.kubernetes.io/node-group" = "node-group-a"         # (Optional) node-group name label
  }

  # Outposts require that you encrypt all EBS volumes
  ebs_encrypted   = true
  ebs_kms_key_arn = "arn:aws:kms:us-west-2:799838960553:key/0e8f15cc-d3fc-4da4-ae03-5fadf45cc0fb"
}
