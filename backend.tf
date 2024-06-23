terraform {
  backend "s3"{
  bucket = "terraformstatebucket1012"
  key = "terraform.tfstate"
  region = "us-east-2"
  dynamodb_table = "terraform.tfstate"
  }
}