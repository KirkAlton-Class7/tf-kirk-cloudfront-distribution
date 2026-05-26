
# CloudFront with S3 Origin deployed with Terraform

This project deploys a private S3 static site behind CloudFront. The S3 bucket is not public; CloudFront reaches the bucket through Origin Access Control (OAC).

## Terraform

### Config that is not default

- Creates an S3 bucket for static site files.
- Uploads `index.html`, `error.html`, and image assets.
- Blocks direct public access to the bucket.
- Creates a CloudFront Origin Access Control.
- Adds an S3 bucket policy that allows reads only from this CloudFront distribution.
- Uses the default CloudFront certificate for the generated CloudFront domain.

---

### Resources created

- s3 bucket
- s3 objects
- public access block
- bucket policy with `jsonencode()`
- CloudFront Origin Access Control
- CloudFront distribution

---

### Desired output

- CloudFront URL
- bucket name
- bucket ARN

---

### Policy pattern

```bash
policy = jsonencode({
  Version = "2012-10-17"
  Statement = [
    {
      Sid       = "PublicAccess"
      Effect    = "Allow"
      Principal = "*"
      Action    = "s3:GetObject"
      Resource  = "<resource>"
    }
  ]
})
```

In this repo, the policy grants `s3:GetObject` to the CloudFront service principal and limits access with `AWS:SourceArn` so only this distribution can read the bucket.

### content types

https://udn.realityripple.com/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Common_types




Additional Notes

https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html#toac-permission-to-access-s3
