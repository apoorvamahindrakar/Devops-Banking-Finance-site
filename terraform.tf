terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create an EC2 instance
resource "aws_instance" "Test-Server" {
  ami               = "ami-0c2af51e265bd5e0e"  # Ubuntu AMI ID for us-east-1
  instance_type     = "t2.micro"
  availability_zone = "ap-south-1"
  key_name          = "Banking-app"  # Replace with your actual key pair name

  vpc_security_group_ids = ["sg-09b21d30c0eea4629"]  # Security Group ID

  tags = {
    Name = "Test-Server"
  }
}
