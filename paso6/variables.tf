variable "entorno" {
  description = "Entorno de despliegue"
  type        = string
  default     = "dev"
}

variable "api_key" {
  description = "Clave API sensible"
  type        = string
  sensitive   = true
}
