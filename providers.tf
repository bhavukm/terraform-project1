terraform {
  required_version = ">= 1.0"

  backend "s3" {
    bucket         = "tech-apricate-tf-projects101"
    key            = "project1/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-locks"
  }
}

provider "aws" {
  region = "us-east-1"
}