provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "flugel-vpc-poc"

  cidr = "10.0.0.0/16"

  azs             = ["us-east-2a", "us-east-2b", "us-east-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  assign_generated_ipv6_cidr_block = true

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    Name = "flugel-poc-public"
  }

  tags = {
    Owner       = "sergio"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "flugel-vpc-poc"
  }
}
