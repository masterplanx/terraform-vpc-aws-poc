resource "aws_instance" "flugel_instance_poc" {
  ami 		 = "${data.aws_ami.flugel_instance_poc.id}"
  instance_type  = "t2.micro"
  count          = "${var.instance_count}"

  # the VPC subnet
  subnet_id = "${element(module.vpc.private_subnets, 0)}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.ssh-private.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.sergiokeypair.key_name}"

  tags {
    Name = "flugel_instance_poc"
  }

}

