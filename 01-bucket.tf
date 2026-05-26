resource "aws_s3_bucket" "website" {
  bucket        = lower("${local.name_prefix}-${local.bucket_suffix}")
  force_destroy = true

  tags = {
    Name        = local.name_prefix
    Environment = var.env
  }
}
