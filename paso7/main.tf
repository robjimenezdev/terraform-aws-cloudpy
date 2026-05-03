terraform {
  backend "s3" {
    bucket = "cloudpy-terraform-state"
    key    = "paso7/terraform.tfstate"
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

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
  tags = {
    Proyecto   = "cloudpy"
    Gestionado = "terraform"
  }
}

module "dynamodb" {
  source     = "./modules/dynamodb"
  table_name = var.table_name
  tags = {
    Proyecto   = "cloudpy"
    Gestionado = "terraform"
  }
}

module "lambda" {
  source        = "./modules/lambda"
  function_name = var.lambda_name
  role_arn      = var.lambda_role_arn
  table_name    = module.dynamodb.table_name
  tags = {
    Proyecto   = "cloudpy"
    Gestionado = "terraform"
  }
}
