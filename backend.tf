# IMPORTANT: COMMISSION BUCKET AND DYNAMODB TABLES FIRST
terraform {
  backend "s3" {
    bucket         = "chickenmasala-tf-state"
    key            = "infra/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "tf-state-lock"
    encrypt        = true
  }
}
