provider "aws" {
  region = "eu-north-1"
}

resource "random_string" "bucketrandom" {
  length  = 11  
  upper   = false
  lower   = true
  number  = true
  special = false
}

resource "aws_s3_bucket" "test" {
  bucket = "${var.bucket_name}${random_string.bucketrandom.result}"
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

