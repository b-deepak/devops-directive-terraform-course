terraform {
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

resource "aws_instance" "example" {
  ami           = "ami-0c00d3cdac3e96ae2" # amazon linux 2 // x86 // us-west-2
      #"ami-0c00d3cdac3e96ae2" # Ubuntu 20.04 LTS // us-west-2
  instance_type = "t2.micro"
}
