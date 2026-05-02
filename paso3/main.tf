terraform {
  backend "s3" {
    bucket = "cloudpy-terraform-state"
    key    = "semana3/terraform.tfstate"
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

module "bucket_web" {
  source      = "./modules/s3-bucket"
  bucket_name = "cloudpy-terraform-web-s3"
  tags = {
    Proyecto   = "cloudpy"
    Tipo       = "web"
    Gestionado = "terraform"
  }
}

module "bucket_backup" {
  source      = "./modules/s3-bucket"
  bucket_name = "cloudpy-terraform-backup-s3"
  tags = {
    Proyecto   = "cloudpy"
    Tipo       = "backup"
    Gestionado = "terraform"
  }
}

data "aws_s3_bucket" "state" {
  bucket = "cloudpy-terraform-state"
}

output "state_bucket_region" {
  value = data.aws_s3_bucket.state.region
}
