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
terraform {
  backend "s3" {
    bucket = "tfstate222"
    key    = "state/"
    region = "eu-north-1"
  }
}
