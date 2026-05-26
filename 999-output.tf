output "cloudfront_url" {
  value       = "https://${aws_cloudfront_distribution.s3_distribution.domain_name}"
  description = "The CloudFront URL for the static website."
}

output "bucket_info" {
  value = {
    name = aws_s3_bucket.website.bucket
    arn  = aws_s3_bucket.website.arn
  }
  description = "The backing S3 bucket name and ARN."
}
