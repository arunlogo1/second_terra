
variable "vpc_out_id" {}

//create a key pair
resource "aws_key_pair" "kp_devops" {
  key_name   = "kp_devops"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDIKD1ycl/hXF4bXq/hbqFFtVoTpMzsRiYOHvGAEKSbR35iHRGgKS8VJoafMYcMF1OBIyE6vXj3HxkPE2Syg34wpGtrrpLQ7IWpwCimu5TXTTncdAnMlXeD3t5iPDE8JR19/hT+soZkJuHNjG+rrBpbaE39u9D2J3HzUGSypo/81pZUqBTFUkGLIKIft4wBv+8NtKFVP+muEegmJP7XTGhgND4AbcHLfjruY1i7s2Fae3p0u3bEsllzQ9bCCoYe7RVA2NJ2wcaDZltJw4VT4otbLrJxSKoG3ZmPVeBvZetpDMFOXqgfUGVnQl7HEcuPUszhMICm9xn1qMS3XQhFB1hD ec2-user@ip-172-31-95-178.ec2.internal"
}




resource "aws_security_group" "devops_22_scg" {
  name        = "devops_22_scg"
  description = "Allow port 22inbound traffic"
  vpc_id      = "${var.vpc_out_id}"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks =  ["0.0.0.0/0"] # add a CIDR block here
  }

  egress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = {
    Name = "devops_22_scg"
  }
}

resource "aws_security_group" "devops_80_scg" {
  name        = "devops_80_scg"
  description = "Allow port 80 inbound traffic"
  vpc_id      = "${var.vpc_out_id}"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks =  ["0.0.0.0/0"] # add a CIDR block here
  }

  egress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = {
    Name = "devops_80_scg"
  }
}


output "sg_id_22" {
	value = "${aws_security_group.devops_22_scg.id}"

}

output "sg_id_80" {
        value = "${aws_security_group.devops_80_scg.id}"
}

