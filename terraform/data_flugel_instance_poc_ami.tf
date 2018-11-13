data "aws_ami" "flugel_instance_poc" {
    most_recent = true

    filter {
        name   = "name"
        values = ["flugel_instance_poc-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["${var.image_owner}"]
}

