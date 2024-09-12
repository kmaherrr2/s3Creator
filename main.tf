provider "aws" {
  region = "eu-north-1"
}
resource "aws_s3_bucket" "test" {
  bucket = var.bucket_name
  acl    = "private"
  
  versioning {
    enabled = var.versioning
  }
}
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::mybucket"
    },
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject"],
      "Resource": "arn:aws:s3:::mybucket/path/to/my/key"
    }
  ]
}

terraform {
  backend "s3" {
    bucket = "tfstate222"
    key    = "state"
    region = "eu-north-1"
  }
}

