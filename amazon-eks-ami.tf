// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

# Most recent optimizaed Amazon EKS AMI
data "aws_ami" "selected_eks_optimized_ami" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amazon-eks-node-${data.aws_eks_cluster.selected.version}*"]
  }

  filter {
    name   = "architecture"
    values = data.aws_ec2_instance_type.selected.supported_architectures
  }

  filter {
    name   = "virtualization-type"
    values = data.aws_ec2_instance_type.selected.supported_virtualization_types
  }

  filter {
    name   = "root-device-type"
    values = data.aws_ec2_instance_type.selected.supported_root_device_types
  }
}
