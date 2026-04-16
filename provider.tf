terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0" # ultima versión según documentación de registry - terraform
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
