provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_s3_bucket" "tf-state" {
  bucket        = "chickenmasala-tf-state"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "tf-state-versioning-config" {
  bucket = aws_s3_bucket.tf-state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf-state-sse-config" {
  bucket = aws_s3_bucket.tf-state.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "tf-state-lock" {
  name         = "tf-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_instance" "test_ec2" {
  ami           = "ami-012c2e8e24e2ae21d"
  instance_type = "t2.micro"
}

