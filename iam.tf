// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

resource "aws_iam_role" "eks_self_managed_node_group" {
  name               = "${var.eks_cluster_name}-${local.node_group_name}-role"
  assume_role_policy = file("${path.module}/iam_ec2_assume_role_policy.json")
  tags               = var.tags
}

resource "aws_iam_role_policy_attachment" "amazon_eks_worker_node_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_self_managed_node_group.name
}

resource "aws_iam_role_policy_attachment" "amazon_eks_cni_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks_self_managed_node_group.name
}

resource "aws_iam_role_policy_attachment" "amazon_ec2_container_registry_read_only" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks_self_managed_node_group.name
}

resource "aws_iam_instance_profile" "eks_self_managed_node_group" {
  name = "${var.eks_cluster_name}-${local.node_group_name}-instance-profile"
  role = aws_iam_role.eks_self_managed_node_group.name
  tags = var.tags
}
