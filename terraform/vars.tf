variable "AWS_REGION" {
  default = "us-east-2"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "../sergiokey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "../sergiokey.pub"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-2 = "ami-0782e9ee97725263d"
    us-east-1 = "ami-0a386db7264bbbca5"
    us-west-1 = "ami-01a4d1b7f90b50bba"
  }
}
variable "image_owner" {}
variable "instance_count" {}
