aws_region  = "ap-south-1"
environment = "dev"

cluster_name = "milvus-eks-dev"

vpc_cidr = "10.20.0.0/16"

azs = [
  "ap-south-1a",
  "ap-south-1b"
]

private_subnets = [
  "10.20.1.0/24",
  "10.20.2.0/24"
]

public_subnets = [
  "10.20.101.0/24",
  "10.20.102.0/24"
]

node_instance_types = ["t3.medium"]

node_desired_size = 1
node_min_size     = 1
node_max_size     = 2

milvus_namespace = "milvus-dev"

milvus_s3_bucket_name = "milvus-standalone-dev-chandan"

app_repo_url = "https://github.com/Chandan007-win/milvus-app-repo.git"
