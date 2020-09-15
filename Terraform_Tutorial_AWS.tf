# Terraform Tutorial: AWS!
#   1. Create an S3 bucket.
#   2. Create an EC2 instance.

# 1. Will need to configure an AWS User (IAM) with Programmatic access first!
# 2. AWS CLI should be installed next with credentials set up for the User
# created in (1.).

# Configure the AWS Provider. Running [terraform init] will need to be
# run in order to properly check for/download the plugin for the "aws"
# provider.
#   https://registry.terraform.io/providers/hashicorp/aws/latest/docs
#
# Once the AWS CLI has been installed, run the following to set up a
# local credentials file:
#   1. [aws configure] Run this command to quickly set and view your
#   credentials, regionm and output format. See the following site
#   link for more information:
#     https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html
provider "aws" {
  version                 = "~> 3.0"
  region                  = "us-east-1"
  shared_credentials_file = "C:/Users/gpowers/.aws/credentials"
}

# Using Terraform Resources, set up an AWS S3 bucket:
resource "aws_s3_bucket" "b" {
  bucket        = "grp-tf-test-bucket"
  acl           = "private"
  force_destroy = "true"
}

# Using Terraform Resources, set up an AWS EC2 instance:
resource "aws_instance" "grp-ec2" {
  ami           = "ami-0eb7fbcc77e5e6ec6"
  instance_type = "t2.micro"
}