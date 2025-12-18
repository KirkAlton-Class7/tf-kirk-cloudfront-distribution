resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.website.id
  key    = "index.html"
  source = "./index.html"
  content_type = "text/html"

  etag = filemd5("./index.html")
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.website.id
  key    = "error.html"
  source = "./lab-example/error.html"
  content_type = "text/html"

  etag = filemd5("./error.html")
}

resource "aws_s3_object" "image" {
  bucket = aws_s3_bucket.website.id
  key    = "image.jpg"
  source = "./lab-example/image.jpg"
  content_type = "image/jpeg"

  etag = filemd5("./image.jpg")
}

resource "aws_s3_object" "image_2" {
  bucket = aws_s3_bucket.website.id
  key    = "image.jpg"
  source = "./image_2.jpg"
  content_type = "image/jpeg"

  etag = filemd5("./image_2.jpg")
}