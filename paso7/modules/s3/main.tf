resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  tags   = var.tags

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [tags]
  }
}

