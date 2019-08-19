provider "aws" {
        region = "us-east-1"
        profile = "default"


}

//create vpc,igw,assoicate igw with routetable

module "vpc_module" {
	source ="./vpcdir"
}

//create a public subnet

module "subnet" {
	vpc_out_id = "${module.vpc_module.vpc_out_id}"
	source = "./subdir"
}

// create a Sceurity group and Keypairs

module "sg_group" {
        vpc_out_id = "${module.vpc_module.vpc_out_id}"
        source = "./sgdir"
}

module "ec2_module" {
	sub_pub_out = "${module.subnet.sub_pub_out}"
        sg_id_22 = "${module.sg_group.sg_id_22}"
	sg_id_80 = "${module.sg_group.sg_id_80}"
        source = "./ec2dir"
}


output "final" {
 	value = "${module.vpc_module.vpc_route_id}"
}
