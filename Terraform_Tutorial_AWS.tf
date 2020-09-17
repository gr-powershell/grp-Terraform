/*
Terraform Tutorial: [AWS]
  1. Create an S3 bucket.
  2. Create an EC2 instance.

!IMPORTANT! -- Need to edit the .git/info/exclusions file with the
following directory:
  .terraform

The directory is too large for [git push] to work!

AWS Config:
1. Will need to configure an AWS User (IAM) with Programmatic access first!

2. AWS CLI should be installed next with credentials set up for the User

3. Configure the AWS Provider. Running [terraform init] will need to be
run in order to properly check for/download the plugin for the "aws"
provider.
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs

4. Once the AWS CLI has been installed, run the following to set up a
local credentials file:
  1. [aws configure] Run this command to quickly set and view your
  credentials, regionm and output format. See the following site
  link for more information:
    https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html
*/

/*
:: VARIABLES ::

Declaring variable(s) within the file:
  The following will ask for a value for the variable when
  [terraform plan] is called since there is value provided:
  
    variable "aws_region" {
      type = "string"
    }

Better way to declare the variable is with a [default] parameter:
  
  variable "aws_region" {
    type    = "string"
    default = "us-east-1"
  }

The following can be created directly within the main .tf file or
can be declared within a module file and called directly!

Code to be created within a module file:

# Using Terraform Providers, declare the AWS provider:
provider "aws" {
  version                 = "~> 3.0"
  region                  = var.aws_region
  shared_credentials_file = "C:/Users/gpowers/.aws/credentials"
}

# Using Terraform Resources, set up an AWS S3 bucket:
resource "aws_s3_bucket" "b" {
  bucket        = "grp-tf-test-bucket"
  acl           = "private"
  force_destroy = var.s3_destroy
}

# Using Terraform Resources, set up an AWS EC2 instance:
resource "aws_instance" "grp-ec2" {
  ami           = "ami-0eb7fbcc77e5e6ec6"
  instance_type = var.ec2_instance_type
}
*/

# Call the output from the child module:
output "s3_fordes" {
  value = "${module.AWS.s3_fordes}"
}

# Call the child [AWS] module:
module "AWS" {
  source = "./tfModules"

}