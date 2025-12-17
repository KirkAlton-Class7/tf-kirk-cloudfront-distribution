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
    # Statement = [
    #   {
    #     Sid    = "AllowFaccess"
    #     Effect = "Allow"
    #     Principal = {
    #       Service = "cloudfront.amazonaws.com"
    #     }
    #     Action   = "s3:GetObject"
    #     Resource = "${aws_s3_bucket.website.arn}/*"
    #     Condition = {
    #       StringEquals = {
    #         "AWS:SourceArn" = "${aws_cloudfront_distribution.website.arn}"
    #       }
    #     }
    #   }
    # ]
  })
   # add this explicit dependency, dependency chain issues occur intermittently
  depends_on = [aws_s3_bucket_public_access_block.website]
}