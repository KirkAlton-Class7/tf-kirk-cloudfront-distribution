S3 Static Website hosting lab: Dec 6th 2025

## ClickOps
1. Open console and go to S3 dashbord
2. get staic assets
3 crete bucket
4 uplod assets
5 make it publiclly accessible
- remove the "block all public acces" setting
- add a bucket policy
6 verify public access
7 enbable satic hosting (we arent' using objet endpoints)
- set the index and error pages

## Terraform

#### Config that *is not* default:
- added a bucket policy
-disable "bloack all public access"
- enable static website hosting
- uploaded objects

### Resource to crerate:
- S3 Bucket
- S3 Object (upload them to the corresponding bucket)
- Public Access Block (we are disabling this)
- S3 Bucket Policy (explain JSONencode())
- Enable Static Website Hosting

### Desired Output:
- Static Website URL
- Bucket Name
- Bucket ARN


#JSONencode
# https://developer.hashicorp.com/terraform/language/functions/jsonencode











# S3 Static Website Hosting Lab (Dec 6, 2025)

## 1. ClickOps Workflow (AWS Console)

### Steps
1. Open AWS Console → **S3 Dashboard**  
2. Gather static assets (HTML/CSS/JS)  
3. **Create an S3 bucket**
   - Must be globally unique  
4. **Upload objects** to the bucket  
5. **Configure public access**
   - Disable “Block all public access”  
   - Add a bucket policy allowing public `s3:GetObject`  

### Bucket Policy Template
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::YOUR_BUCKET_NAME/*"
    }
  ]
}
```


