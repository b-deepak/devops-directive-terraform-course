terraform {
  backend "remote" {
    organization = "devops-directive"

    workspaces {
      name = "devops-directive-terraform-course"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.67.0"
    }
  }
}

provider "aws" {
  profile = "terraform-user"
  region = "us-west-2"
}
