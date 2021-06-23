// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

# -----------------------------------------------------------------------------
# Required input variables
# -----------------------------------------------------------------------------
variable "eks_cluster_name" {
  type        = string
  description = "(Required) The name of the Amazon EKS cluster."
}

variable "instance_type" {
  type        = string
  description = "(Required) The EC2 instance type to use for the worker nodes."
}

variable "desired_capacity" {
  type        = number
  description = "(Required) The desired number of nodes to create in the node group."
}

variable "min_size" {
  type        = number
  description = "(Required) The minimum number of nodes to create in the node group."
}

variable "max_size" {
  type        = number
  description = "(Required) The maximum number of nodes to create in the node group."
}

variable "subnets" {
  type        = list(string)
  description = "(Required) A list of subnet IDs to launch nodes in. Subnets automatically determine which availability zones the node group will reside."
}


# -----------------------------------------------------------------------------
# Optional input variables
# -----------------------------------------------------------------------------
variable "name" {
  type        = string
  description = "(Optional) The name to be used for the self-managed node group. By default, the module will generate a unique name."
  default     = ""
}

variable "name_prefix" {
  type        = string
  description = "(Optional) Creates a unique name beginning with the specified prefix. Conflicts with `name`."
  default     = "node-group"
}

variable "tags" {
  type        = map(any)
  description = "(Optional) Tags to apply to all tag-able resources."
  default     = {}
}

variable "node_labels" {
  type        = map(any)
  description = "(Optional) Kubernetes labels to apply to all nodes in the node group."
  default     = {}
}

variable "key_name" {
  type        = string
  description = "(Optional) The name of the EC2 key pair to configure on the nodes."
  default     = null
}

variable "security_group_ids" {
  type        = list(string)
  description = "(Optional) A list of security group IDs to associate with the worker nodes. The module automatically associates the EKS cluster security group with the nodes."
  default     = []
}

variable "ebs_encrypted" {
  type        = bool
  description = "(Optional) Enables EBS encryption on the volume. By default, the module uses the setting from the selected AMI."
  default     = null
}

variable "ebs_kms_key_arn" {
  type        = string
  description = "(Optional) The ARN of the AWS Key Management Service (AWS KMS) to use when creating the encrypted volume. `encrypted` must be set to true when this is set."
  default     = null
}

variable "ebs_volume_size" {
  type        = number
  description = "(Optional) The EBS volume size for a worker node. By default, the module uses the setting from the selected AMI."
  default     = null
}

variable "ebs_volume_type" {
  type        = string
  description = "(Optional) The EBS volume type for a worker node. By default, the module uses the setting from the selected AMI."
  default     = ""
}

variable "ebs_iops" {
  type        = number
  description = "(Optional) The amount of provisioned IOPS for a worker node. This must be set with an `ebs_volume_type` of `io1` or `io2`."
  default     = null
}

variable "ebs_throughput" {
  type        = number
  description = "(Optional) The throughput to provision for a `gp3` volume in MiB/s (specified as an integer)."
  default     = null
}

variable "ebs_delete_on_termination" {
  type        = number
  description = "(Optional) Whether the worker node EBS volumes should be destroyed on instance termination. By default, the module uses the setting from the selected AMI."
  default     = null
}


# -----------------------------------------------------------------------------
# Local variables
# -----------------------------------------------------------------------------
resource "random_id" "name_suffix" {
  byte_length = 8
}

locals {
  node_group_name = coalesce(var.name, "${var.name_prefix}-${random_id.name_suffix.hex}")
}
