variable "my_public_key" {}

variable "instance_type" {}

variable "security_group" {}

variable "subnets2" {
  type = list(string)
}
