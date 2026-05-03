variable "bucket_name" {
  description = "Nombre del bucket S3 de cloudpy.es"
  type        = string
}

variable "table_name" {
  description = "Nombre de la tabla DynamoDB"
  type        = string
}

variable "lambda_name" {
  description = "Nombre de la función Lambda"
  type        = string
}

variable "lambda_role_arn" {
  description = "ARN del rol IAM de la Lambda"
  type        = string
  sensitive   = true
}
