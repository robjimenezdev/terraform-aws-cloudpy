variable "bucket_name" {
  description = "Nombre del bucket S3"
  type        = string
}

variable "tags" {
  description = "Tags del recurso"
  type        = map(string)
  default     = {}
}
