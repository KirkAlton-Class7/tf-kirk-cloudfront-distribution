# S3 Static Website Hosting Lab (Dec 6, 2025)

Deploy a static website using **Amazon S3** via both **ClickOps (Console)** and **Terraform**.

---

## 1. ClickOps (AWS Console)

1. Log in to the **AWS Console** and open the **S3 Dashboard**.
2. Prepare your **static assets** (HTML/CSS/JS, e.g., `index.html`, `error.html`, etc.).
3. **Create an S3 bucket**  
   - Bucket name must be **globally unique**.  
   - Choose your target **region**.
4. **Upload assets** to the bucket  
   - Use **Upload** → Add files → Upload all static site files.
5. **Make the bucket publicly accessible**
   - Go to **Permissions** → **Block public access (bucket settings)**.  
   - Uncheck **“Block all public access”** and confirm the warning.  
   - Add a **Bucket Policy** to allow public read:

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

   
6. **Verify Public Access**
- After uploading objects, open the **Object URL** for a file such as `index.html`.
- If the bucket policy and public access settings are correct, the file loads without requiring authentication.
- If access is denied:
  - Re-check **Block Public Access** settings.
  - Confirm the **bucket policy** includes `s3:GetObject` for `arn:aws:s3:::BUCKET_NAME/*`.

---

7. **Enable Static Website Hosting**
- Navigate to **Bucket → Properties → Static Website Hosting**.
- Select **Enable**.
- Configure:
  - **Index document**: `index.html`
  - **Error document**: `error.html`
- Save changes.
- Copy the generated **Website Endpoint**.  
  - Note: *This is not the same as an S3 object URL.*

---

## Terraform Implementation

### Non-Default Configurations Required
- Add an S3 **bucket policy** for public read.
- Disable **Block Public Access** settings.
- Enable **Static Website Hosting**.
- Upload objects via **`aws_s3_object`**.

---

### Resources to Create

| Resource | Purpose |
|---------|---------|
| `aws_s3_bucket` | Creates the S3 bucket |
| `aws_s3_bucket_public_access_block` | Disables “block all public access” |
| `aws_s3_bucket_policy` | Grants public read access |
| `aws_s3_object` | Uploads site files |
| Website hosting block | Sets index/error pages |

---

## Desired Terraform Outputs

| Output | Description |
|--------|-------------|
| `bucket_name` | The S3 bucket name |
| `bucket_arn` | The ARN of the bucket |
| `website_endpoint` | Public static website hosting URL |

## Note on `jsonencode()`
Terraform requires policies to be valid JSON strings. Instead of writing JSON manually and risking formatting errors, you can use the `jsonencode()` function to convert Terraform maps into properly escaped JSON.

### Reference
https://developer.hashicorp.com/terraform/language/functions/jsonencode

### Example (S3 Bucket Policy)
```hcl
policy = jsonencode({
  Version = "2012-10-17"
  Statement = [{
    Effect    = "Allow"
    Principal = "*"
    Action    = "s3:GetObject"
    Resource  = "${aws_s3_bucket.site.arn}/*"
  }]
})

