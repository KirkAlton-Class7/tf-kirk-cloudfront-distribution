
# CloudFront with S3 Origin deployed with Terraform: Dec 14th 2025
------

## Terraform

### Config that is not "default":
- added a bucket policy
- block all public access (or not)
make a policy

---

### Resource to create:
- s3 bucket
- s3 objects
- public access block (we are disabling this)
- make a policy (explain jsonencode())
- static website config

---

### Desired output:
CF URL (fully formed)
- bucket name

---

### policy

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

### content types

https://udn.realityripple.com/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Common_types




Additional Notes

https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html#toac-permission-to-access-s3