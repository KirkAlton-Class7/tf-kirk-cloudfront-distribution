# # output "website_url" {
# #   value       = "http://${aws_s3_bucket_website_configuration.website.website_endpoint}"
# #   description = "The URL of the static website hosted on the S3 bucket"
# # }

# output "bucket_info" {
#   value = {
#     name = aws_s3_bucket.website.bucket
#     arn = aws_s3_bucket.website.arn
#   }
# }

# # Output JSON encode function
# output "json" {
#   value = jsonencode({
#     Version = "2012-10-17"
#   })
# }
 
#  # Output the argument in the JSON encode function
# output "raw" {
#   value =       {
#     version = "2012-10-17"
#   }
# }

# output "policy" {
#   value       = aws_s3_bucket_policy.cloudfront_access
# } 