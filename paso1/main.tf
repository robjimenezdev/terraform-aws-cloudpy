terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_s3_bucket" "practica" {
  bucket = "cloudpy-terraform-practica-s1"

  tags = {
    Proyecto   = "cloudpy"
    Semana     = "1"
    Gestionado = "terraform"
  }
}
