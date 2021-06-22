// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

output "name" {
  value = "${var.eks_cluster_name}-${local.node_group_name}"
}

output "role_arn" {
  value = aws_iam_role.eks_self_managed_node_group.arn
}

output "ami_id" {
  value = data.aws_ami.selected_eks_optimized_ami.id
}

output "ami_name" {
  value = data.aws_ami.selected_eks_optimized_ami.name
}

output "ami_description" {
  value = data.aws_ami.selected_eks_optimized_ami.description
}

output "ami_creation_date" {
  value = data.aws_ami.selected_eks_optimized_ami.creation_date
}
