variable sg_id_22 {}
variable sg_id_80 {}
variable sub_pub_out {}
variable "amid" {
        type = "string"
        default="ami-035b3c7efe6d061d5"

}


resource "aws_instance" "ec2_devops" {
  ami           = "${var.amid}"
  instance_type = "t2.micro"
  key_name = "kp_devops"
  subnet_id = "${var.sub_pub_out}"
  vpc_security_group_ids =["${var.sg_id_22}","${var.sg_id_80}"]

  tags = {
    Name = "ec2_devops"
  }
}


resource "aws_eip" "eip_devops" {
  instance = "${aws_instance.ec2_devops.id}"
  vpc      = true
}


output "eip_output" {
	value = "${aws_eip.eip_devops.id}"
}
