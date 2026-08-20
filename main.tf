terraform {
  required_version = ">= 1.1.0"

  cloud {
    organization = "YOUR_HCP_ORGANIZATION"

    workspaces {
      name = "aws-s3-test"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "test" {
  bucket_prefix = "mani-terraform-test-"

  tags = {
    Name        = "Terraform Test Bucket"
    Environment = "dev"
  }
}