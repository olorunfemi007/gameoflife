# resource "aws_s3_bucket" "terraformstatebucket" {
#   bucket = "terraformstatebucket"  # Ensure this is globally unique

#   tags = {
#     Name        = "terraformstatebucket"
#     Environment = "Dev"
#   }
# }

# resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
#   bucket = aws_s3_bucket.terraformstatebucket.bucket

#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = "AES256"
#     }
#   }
# }

# resource "aws_dynamodb_table" "terraform_state_lock" {
#   name           = "terraform.tfstate"
#   read_capacity  = 1
#   write_capacity = 1
#   hash_key       = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }

terraform {
  backend "s3"{
  bucket = "terraformstatebucket1012"
  key = "terraform.tfstate"
  region = "us-east-2"
  dynamodb_table = "terraform.tfstate"
  }
}