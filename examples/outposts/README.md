# Amazon EKS on AWS Outposts

You deploy Amazon EKS worker nodes to Outposts *using self-managed node groups*. The worker nodes run on Outposts and register with the Kubernetes control plane in the AWS Region. The worker nodes, and containers running on the nodes, can communicate with AWS services and resources running on the Outpost and in the region (via the Service Link) and with on-premises networks (via the Local Gateway).
 
![Amazon EKS on AWS Outposts architecture](../../diagrams/amazon-eks-on-aws-outposts-architecture.svg)

You use the same AWS and Kubernetes tools and APIs to work with EKS on Outposts nodes that you use to work with EKS nodes in the Region.