output "tabla_nombre" {
  value = aws_dynamodb_table.leads.name
}

output "entorno" {
  value = terraform.workspace
}
