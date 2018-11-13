resource "aws_instance" "flugel_bastion_instance_poc" {
  ami           = "${data.aws_ami.flugel_bastion_instance_poc.id}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${element(module.vpc.public_subnets, 0)}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.ssh-public.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.sergiokeypair.key_name}"

  tags {
    Name = "bastion_flugel_instance_poc"
  }

}
