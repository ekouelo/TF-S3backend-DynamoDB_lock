# Terraform configuration
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  # Configure the Remote Bakend on AWS S3
  backend "s3" {
    bucket         = "tonyo987650-S3-wordpress"
    key            = "vpc_network.tfstate"
    region         = "us-east-1"
    dynamodb_table = "remote-state-dynamodb-wordpress"
  }

}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
