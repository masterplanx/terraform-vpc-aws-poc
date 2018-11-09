resource "aws_key_pair" "sergiokeypair" {
  key_name = "sergiokeypair"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
