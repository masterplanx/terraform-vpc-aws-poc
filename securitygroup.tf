resource "aws_security_group" "ssh-public" {
  vpc_id = "${module.vpc.vpc_id}"
  name = "ssh-public"
  description = "security group that allows ssh and all egress traffic"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
tags {
    Name = "ssh-public"
  }
}


resource "aws_security_group" "ssh-private" {
  vpc_id = "${module.vpc.vpc_id}"
  name = "ssh-private"
  description = "security group that allows ssh from private subnet"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["${module.vpc.vpc_cidr_block}"]
  }
tags {
    Name = "ssh-private"
  }
}
