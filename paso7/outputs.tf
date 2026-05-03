output "bucket_nombre" {
  value = module.s3.bucket_name
}

output "tabla_nombre" {
  value = module.dynamodb.table_name
}

output "lambda_arn" {
  value = module.lambda.function_arn
}
