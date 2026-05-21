output "cluster_name" {
  value = module.eks.cluster_name
}

output "s3_bucket_name" {
  value = aws_s3_bucket.milvus.bucket
}

output "milvus_namespace" {
  value = var.milvus_namespace
}
