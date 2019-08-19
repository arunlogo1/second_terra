variable vpc_out_id{}


resource "aws_subnet" "sub_main" {
  vpc_id     = "${var.vpc_out_id}"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "sub_public_devops"
  }

}

output "sub_pub_out" {
	value = "${aws_subnet.sub_main.id}"
}
