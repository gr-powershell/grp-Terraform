# Variables file to be used with Terraform_Tutorial_AWS.tf.
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "s3_destroy" {
  type    = bool
  default = true # Setting this to override the terraform.tfvars file!
}

variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}