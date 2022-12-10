resource "aws_s3_bucket" "em-bucket" {
  bucket = var.bucketName
}



resource "aws_s3_bucket_acl" "em-bucket" {
  bucket = aws_s3_bucket.em-bucket.id
  acl    = var.aclType
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.em-bucket.bucket
  key    = var.indexPage
  source = var.indexSource
  content_type = var.contentType
  etag = filemd5(var.indexSource)
  acl = var.aclType
 
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.em-bucket.bucket
  key    = var.errorPage
  source = var.errorSource
  content_type = var.contentType
  etag = filemd5(var.errorSource)
  acl = var.aclType
}


resource "aws_s3_bucket_policy" "em-bucket" {
  bucket = aws_s3_bucket.em-bucket.id
  policy = <<POLICY
    {
      "Version": "2012-10-17",
      "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::my-new-bucket/"
    }
  ]
}
POLICY
  }






resource "aws_s3_bucket_website_configuration" "em-bucket" {
  bucket = aws_s3_bucket.em-bucket.bucket

  index_document {
    suffix = var.indexPage
  }

  error_document {
    key = var.errorPage
  }

  routing_rules = <<EOF
  [{
      "Condition": {
          "KeyPrefixEquals": "docs/"
      },
      "Redirect": {
          "ReplaceKeyPrefixWith": ""
      }
  }]
  EOF
}