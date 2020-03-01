
variable "amiid" {
	default = "ami-047bb4163c506cd98"
}

module "shared_vars" {
	source = "../shared_vars"
}

variable "sg_id" {}

resource "aws_instance" "terraform_ec2_instance" {
  ami           = "${var.amiid}"
  instance_type = "t2.micro"
  key_name = "terraform-course"
  vpc_security_group_ids = ["${var.sg_id}"]
 
  tags {
    Name = "EC2_Name_Instance_${module.shared_vars.env_suffix}"
  }
}