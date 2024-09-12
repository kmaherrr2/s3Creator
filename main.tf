provider "aws" {
  region     = "eu-north-1"
  access_key = "AKIAS6OOBLBMB6NIZRII"
  secret_key = "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"
}
resource "aws_s3_bucket" "test" {
  bucket = var.bucket_name
  acl    = "private"
  versioning {
    enabled = var.versioning
  }
}
