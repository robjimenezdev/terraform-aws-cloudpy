resource "aws_lambda_function" "this" {
  function_name = var.function_name
  role          = var.role_arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"
  timeout       = 3

  filename = "lambda.zip"

  tags = var.tags

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [filename, environment, role]
  }
}
