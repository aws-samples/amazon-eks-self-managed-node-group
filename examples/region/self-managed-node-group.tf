// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

# -----------------------------------------------------------------------------
# Deploy a self-managed node group in an AWS Region
# -----------------------------------------------------------------------------
provider "aws" {
  region  = "us-west-2"
  profile = "aws-outposts-dev+sea19.04-Admin"
}

module "eks_self_managed_node_group" {
  source = "../.."

  eks_cluster_name = "cmluns-eks-cluster"
  instance_type    = "m5.2xlarge"
  desired_capacity = 2
  min_size         = 1
  max_size         = 4
  subnets          = ["subnet-0aeebfca3d1a6da83", "subnet-0e407d26b34566b16"] # Region subnet(s)

  node_labels = {
    "node.kubernetes.io/node-group" = "node-group-a" # (Optional) node-group name label
  }
}
