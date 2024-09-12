provider "aws" {
  region = "eu-north-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "versioning" {
  description = "Enable versioning on the S3 bucket"
  type        = bool
}

resource "aws_s3_bucket" "test" {
  bucket = var.bucket_name
  acl    = "private"
  
  versioning {
    enabled = var.versioning
  }
}
