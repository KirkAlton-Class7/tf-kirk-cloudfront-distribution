# output "website_url" {
#   value       = "http://${aws_s3_bucket_website_configuration.website.website_endpoint}"
#   description = "The URL of the static website hosted on the S3 bucket"
# }

output "bucket_info" {
  value = {
    name = aws_s3_bucket.website.bucket
    arn = aws_s3_bucket.website.arn
  }
}

# output "policy" {
#   value       = aws_s3_bucket_policy.allow_public_access_for_all_objects.policy
# }