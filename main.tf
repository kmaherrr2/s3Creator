provider "aws" {
  region = "eu-north-1"
}

resource "random_string" "bucketrandom" {
  length  = 10  
  upper   = true
  lower   = true
  number  = true
  special = false
}

# Use the random string in the S3 bucket name
resource "aws_s3_bucket" "test" {
  bucket = "${var.bucket_name}-${random_string.bucketrandom.result}"
  acl    = "private"
  
  versioning {
    enabled = var.versioning
  }
}

terraform {
  backend "s3" {
    bucket = "tfstate222"
    key    = "tfstate222/state"
    region = "eu-north-1"
  }
}

