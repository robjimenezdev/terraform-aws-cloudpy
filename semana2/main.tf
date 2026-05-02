terraform {
  backend "s3" {
    bucket = "cloudpy-terraform-state"
    key    = "semana2/terraform.tfstate"
    region = "eu-north-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "practica" {
  bucket = local.nombre_completo
  tags   = local.tags_comunes
}
