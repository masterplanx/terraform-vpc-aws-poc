variable "AWS_REGION" {
  default = "us-west-2"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "sergiokey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "sergiokey.pub"
}
variable "AMIS" {
  type = "map"
  default = {
    us-wast-2 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    us-west-2 = "ami-844e0bf7"
  }
}
