terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.52.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "backend_bucket" {
  bucket = "244190102671-camilo-gallego"
  tags = {
    Owner    = "milo"
    bootcamp = "devops"
  }
}

resource "aws_s3_bucket" "backend_bucket" {
  bucket = "244190102671-camilo-gallego-2"
  tags = {
    Owner    = "milo"
    bootcamp = "devops"
  }
}

resource "aws_dynamodb_table" "tf_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}