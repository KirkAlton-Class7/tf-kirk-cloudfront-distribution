resource "aws_s3_bucket" "website" {
  bucket_prefix = "kirk-static-website-"
  force_destroy = true

  tags = {
    Name        = "Kirk Static Website"
    Environment = "Dev"
  }
}