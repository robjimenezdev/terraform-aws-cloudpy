variable "bucket_name" {
  description = "Nombre del bucket S3"
  type = string
}

variable "tags" {
  description ="Tags a aplicar al bucket"
  type = map(string)
  default = {}
}
