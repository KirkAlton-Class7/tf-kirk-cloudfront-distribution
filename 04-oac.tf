# Locals are a method for storing and evaluating expressions.
# Use `locals` to define reusable values that are referenced multiple times but don't change.
# These values behave like local variables in a function: scoped, reusable, and immutable.
locals {
  origin_id = "S3-${aws_s3_bucket.website.bucket}"
}

resource "aws_cloudfront_origin_access_control" "website" {
  name                              = local.origin_id # Reference to the local value defined in the `locals` block
  description                       = "Origin access control for ${aws_s3_bucket.website.bucket}"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}
