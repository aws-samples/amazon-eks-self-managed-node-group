# Amazon EKS Self-Managed Node Group Terraform Module

Terraform module to create Amazon EKS self-managed node groups on AWS.

## Usage

```terraform
module "eks_self_managed_node_group" {
  source = "../.."

  eks_cluster_name = "hybrid-eks"
  instance_type    = "m5.large"
  desired_capacity = 1
  min_size         = 1
  max_size         = 1
  subnets          = ["subnet-0e1177576467ce040", "subnet-074aeec5cc35f442b"]
}
```

## Examples

- [Self-managed node group running in the Region](./examples/region/)

## Inputs

### Required

- `eks_cluster_name` - The name of the Amazon EKS cluster.
- `instance_type` - The EC2 instance type to use for the worker nodes.
- `desired_capacity` - The desired number of nodes to create in the node group.
- `min_size` - The minimum number of nodes to create in the node group.
- `max_size` - The maximum number of nodes to create in the node group.
- `subnets` - A list of subnet IDs to launch nodes in. Subnets automatically determine which availability zones the node group will reside.

### Optional

- `name` - The name to be used for the self-managed node group. By default, the module will generate a unique name.
- `name_prefix` - Creates a unique name beginning with the specified prefix. Conflicts with `name`.
- `tags` - Tags to apply to all tag-able resources.
- `node_labels` - Kubernetes labels to apply to all nodes in the node group.
- `key_name` - The name of the EC2 key pair to configure on the nodes.
- `security_group_ids` - A list of security group IDs to associate with the worker nodes. The module automatically associates the EKS cluster security group with the nodes.
- `ebs_encrypted` - Enables EBS encryption on the volume. By default, the module uses the setting from the selected AMI.
- `ebs_kms_key_arn` - The ARN of the AWS Key Management Service (AWS KMS) to use when creating the encrypted volume. `encrypted` must be set to true when this is set.
- `ebs_volume_size` - The EBS volume size for a worker node. By default, the module uses the setting from the selected AMI.
- `ebs_volume_type` - The EBS volume type for a worker node. By default, the module uses the setting from the selected AMI.
- `ebs_iops` - The amount of provisioned IOPS for a worker node. This must be set with an `ebs_volume_type` of `io1` or `io2`.
- `ebs_throughput` - The throughput to provision for a `gp3` volume in MiB/s (specified as an integer).
- `ebs_delete_on_termination` - Whether the worker node EBS volumes should be destroyed on instance termination. By default, the module uses the setting from the selected AMI.

## Outputs

- `name` - The full name of the self-managed node group.
- `role_arn` - The ARN of the node group IAM role.
- `ami_id` - The ID of the selected Amazon EKS optimized AMI.
- `ami_name` - The name of the selected Amazon EKS optimized AMI.
- `ami_description` - The description of the selected Amazon EKS optimized AMI.
- `ami_creation_date` - The creation date of the selected Amazon EKS optimized AMI.


Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
