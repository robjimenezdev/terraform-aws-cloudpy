variable "table_name" {
  description = "Nombre de la tabla DynamoDB"
  type        = string
}

variable "tags" {
  description = "Tags del recurso"
  type        = map(string)
  default     = {}
}
