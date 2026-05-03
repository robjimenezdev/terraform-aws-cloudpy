output "tabla_nombre" {
  value = aws_dynamodb_table.leads.name
}

output "bucket_nombre" {
  value = aws_s3_bucket.assets.bucket
}

output "api_key" {
  value     = var.api_key
  sensitive = true
}
