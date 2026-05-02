output "web_bucket_arn" {
  value = module.bucket_web.bucket_arn
}

output "backup_bucket_arn" {
  value = module.bucket_backup.bucket_arn
}

