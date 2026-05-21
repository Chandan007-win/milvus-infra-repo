terraform {
  backend "s3" {
    bucket         = "milvus-terraform-state-dev"
    key            = "milvus/dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "milvus-terraform-lock-dev"
    encrypt        = true
  }
}
