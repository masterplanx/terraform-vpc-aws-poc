resource "aws_instance" "public-instance" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${element(module.vpc.public_subnets, 0)}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.ssh-public.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.sergiokeypair.key_name}"
}

resource "aws_instance" "private-instance" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${element(module.vpc.private_subnets, 0)}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.ssh-private.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.sergiokeypair.key_name}"
}
