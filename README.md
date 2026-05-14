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
- paso4/ — IAM, Lambda y DynamoDB con dependencias implícitas
- paso5/ — workspaces, terraform import y gestión de drift
- paso6/ — lifecycle rules, prevent_destroy y sensitive variables
- paso7/ — importación de infra real de cloudpy.es (S3, Lambda, DynamoDB)
- paso8/ — CI/CD con GitHub Actions, terraform plan en PR y apply en merge

## Requisitos
- Terraform >= 1.0
- AWS CLI configurado con SSO

## Cómo ejecutar
1. aws sso login --profile name
2. cd semana1
3. terraform init
4. terraform plan
5. terraform apply
