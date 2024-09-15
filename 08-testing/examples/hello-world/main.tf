terraform {
  # Assumes s3 bucket and dynamo DB table already set up
  # See /code/03-basics/aws-backend
  backend "s3" {
    bucket         = "devops-terraform-course-tf-state"
    key            = "08-testing/examples/hello-world/terraform.tfstate"
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


module "web_app" {
  source = "../../modules/hello-world"
}

output "instance_ip_addr" {
  value = module.web_app.instance_ip_addr
}

output "url" {
  value = "http://${module.web_app.instance_ip_addr}:8080"
}
