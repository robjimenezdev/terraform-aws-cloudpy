variable "function_name" {
  description = "Nombre de la función Lambda"
  type        = string
}

variable "role_arn" {
  description = "ARN del rol IAM"
  type        = string
}

variable "table_name" {
  description = "Nombre de la tabla DynamoDB"
  type        = string
}

variable "tags" {
  description = "Tags del recurso"
  type        = map(string)
  default     = {}
}
