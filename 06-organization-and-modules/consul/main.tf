terraform {
  # Assumes s3 bucket and dynamo DB table already set up
  # See /code/03-basics/aws-backend
  backend "s3" {
    bucket         = "devops-terraform-course-tf-state"
    key            = "06-organization-and-modules/consul/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
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

############################################################
##
## NOTE: if you are deploying this in your production setup
## follow the instructions in the github repo on how to modify
## deploying with the defaults here as an example of the power
## of modules.
##
## REPO: https://github.com/hashicorp/terraform-aws-consul
##
############################################################
module "consul" {
  source = "git@github.com:hashicorp/terraform-aws-consul.git"
}
