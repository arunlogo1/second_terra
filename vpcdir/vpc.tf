resource "aws_vpc" "vpc_main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "vpc_devops"
  }


}

//create the new internet gateway
resource "aws_internet_gateway" "idw" {
  vpc_id = "${aws_vpc.vpc_main.id}"

  tags = {
    Name = "igw_devops"
  }

}

// add the Internet gateway to the Routable 
resource "aws_route" "route" {  
  route_table_id              =  "${aws_vpc.vpc_main.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id      = "${aws_internet_gateway.idw.id}"
}

output "vpc_out_id" {
   value =  "${aws_vpc.vpc_main.id}"


}

output "vpc_route_id" {	

	value = "${aws_vpc.vpc_main.main_route_table_id}"

}
