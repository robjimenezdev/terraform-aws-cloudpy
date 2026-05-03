terraform {
  backend "s3" {
    bucket = "cloudpy-terraform-state"
    key    = "paso6/terraform.tfstate"
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
  name         = "cloudpy-${var.entorno}-leads"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Proyecto   = "cloudpy"
    Entorno    = var.entorno
    Gestionado = "terraform"
  }

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket" "assets" {
  bucket = "cloudpy-${var.entorno}-assets"

  tags = {
    Proyecto   = "cloudpy"
    Entorno    = var.entorno
    Gestionado = "terraform"
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes        = [tags]
  }
}
