provider "aws" {
  region = "eu-north-1"
}

variable "bucket_name" {
  type        = string
}

variable "versioning" {
  type        = bool
}

resource "aws_s3_bucket" "test" {
  bucket = var.bucket_name
  acl    = "private"
  
  versioning {
    enabled = var.versioning
  }
}
