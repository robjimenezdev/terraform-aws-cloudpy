terraform {
  backend "s3" {
    bucket = "cloudpy-terraform-state"
    key    = "paso4/terraform.tfstate"
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

# Rol IAM para la Lambda
resource "aws_iam_role" "lambda_role" {
  name = "cloudpy-terraform-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

# Permisos básicos de Lambda
resource "aws_iam_role_policy_attachment" "lambda_basic" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Tabla DynamoDB
resource "aws_dynamodb_table" "leads" {
  name         = "cloudpy-terraform-leads"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Proyecto   = "cloudpy"
    Gestionado = "terraform"
  }
}

# Lambda
resource "aws_lambda_function" "formulario" {
  filename      = "lambda.zip"
  function_name = "cloudpy-terraform-formulario"
  role          = aws_iam_role.lambda_role.arn
  handler       = "index.handler"
  runtime       = "nodejs22.x"
  timeout       = 30

  environment {
    variables = {
      TABLE_NAME = aws_dynamodb_table.leads.name
    }
  }
}
