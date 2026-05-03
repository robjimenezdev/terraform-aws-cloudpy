terraform {
  backend "s3" {
    bucket = "cloudpy-terraform-state"
    key    = "paso5/terraform.tfstate"
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
  region = "eu-north-1"
}

resource "aws_dynamodb_table" "leads" {
  name         = "cloudpy-${terraform.workspace}-leads"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Proyecto   = "cloudpy"
    Entorno    = terraform.workspace
    Gestionado = "terraform"
  }
}
resource "aws_s3_bucket" "importado" {
  bucket = "cloudpy-import-prueba"
}
