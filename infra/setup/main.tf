terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.0"
    }
  }

  backend "s3" {
    bucket         = "devops-craigrecipe-app-api-state"
    key            = "tf-state-setup"
    region         = "eu-north-1"
    encrypt        = true
    dynamodb_table = "devops-craigrecipes-app-api-tf-lock"
  }
}

provider "aws" {
  region = "eu-north-1"

  default_tags {
    tags = {
      Environment = terraform.workspace
      Project     = var.project
      Contact     = var.contact
      ManageBy    = "Terraform/setup"
    }
  }
}
