variable "region" {
  description = "Región de AWS donde desplegar"
  type        = string
  default     = "eu-north-1"
}

variable "proyecto" {
  description = "Nombre del proyecto"
  type        = string
  default     = "cloudpy"
}

variable "bucket_name" {
  description = "Nombre del bucket S3"
  type        = string
}
