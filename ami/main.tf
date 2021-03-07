provider "aws" {
  region = "us-west-2"
}

resource "aws_ami_from_instance" "my_ami" {
  name               = "my_ami"
  source_instance_id = var.instance1_id
}
