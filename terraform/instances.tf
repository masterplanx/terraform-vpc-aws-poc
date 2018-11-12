resource "aws_instance" "public-instance" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${element(module.vpc.public_subnets, 0)}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.ssh-public.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.sergiokeypair.key_name}"

  tags {
    Name = "public-instance-test"
  }


  provisioner "remote-exec" {
    inline = [
      "# Connected!",  "sudo apt-get -qq install python -y",
    ]
    connection {
		 host        = "${self.public_ip}"
		 type	     = "ssh"
   		 user        = "ubuntu"	      
	 	 private_key = "${file(var.PATH_TO_PRIVATE_KEY)}"
  	       }
  }

  provisioner "local-exec" {
    environment {
        PUBLIC_IP  = "${self.public_ip}"
        PRIVATE_IP = "${self.private_ip}"
    }

    working_dir = "../ansible/create_users/"
    command     = "ansible-playbook --private-key ../${var.PATH_TO_PRIVATE_KEY} playbook.yml -i ${self.public_ip},"   
 
  }
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

  tags {
    Name = "private-instance-test"
  }

}
