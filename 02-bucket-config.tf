resource "aws_s3_bucket_public_access_block" "website" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = true
  ignore_public_acls      = true
 
  block_public_policy     = true
  restrict_public_buckets = true
}

######
resource "aws_s3_bucket_policy" "cloudfront_access" {
  bucket = aws_s3_bucket.website.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowFaccess"
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.website.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = "${aws_cloudfront_distribution.website.arn}"
          }
        }
      }
    ]
  })
   # Terraform creates implicit dependencies when a resource references another (e.g., via an attribute).
   # Here, there's no direct reference to the public access block, so Terraform may plan/apply out of order.
   # This is an explicit dependency: the S3 bucket policy must wait for the public access block.
   # "depends_on" enforces the correct creation order and prevents intermittent apply errors.
   # Always helpful when dealing with loosely coupled resources that fail silently or intermittently if ordered incorrectly.

  depends_on = [aws_s3_bucket_public_access_block.website]
}