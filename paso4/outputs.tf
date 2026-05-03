output "lambda_arn" {
  value = aws_lambda_function.formulario.arn
}

output "dynamodb_table" {
  value = aws_dynamodb_table.leads.name
}

output "lambda_role_arn" {
  value = aws_iam_role.lambda_role.arn
}
