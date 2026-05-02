locals {
  nombre_completo = "${var.proyecto}-${var.bucket_name}"
  tags_comunes = {
    Proyecto   = var.proyecto
    Gestionado = "terraform"
    Region     = var.region
  }
}
