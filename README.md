# Terraform AWS - Cloudpy

Infraestructura como código para cloudpy.es usando Terraform y AWS.

## Stack
- Terraform 1.14
- AWS: S3, CloudFront, Lambda, API Gateway, DynamoDB
- Remote state en S3

## Estructura
- Paso1/ — primer recurso S3, ciclo init/plan/apply/destroy
- Paso2/ — variables, locals, outputs y remote state en S3
- Paso3/ — módulos reutilizables y data sources

## Requisitos
- Terraform >= 1.0
- AWS CLI configurado con SSO

## Cómo ejecutar
1. aws sso login --profile cloudpy
2. cd semana1
3. terraform init
4. terraform plan
5. terraform apply
