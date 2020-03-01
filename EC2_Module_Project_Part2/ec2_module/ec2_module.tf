
variable "amiid" {
	default = "ami-047bb4163c506cd98"
}

variable "sg_id" {}
variable "ec2_name" {}

resource "aws_instance" "terraform_ec2_instance" {
  ami           = "${var.amiid}"
  instance_type = "t2.micro"
  key_name = "terraform-course"
  vpc_security_group_ids = ["${var.sg_id}"]
 
  tags {
    Name = "${var.ec2_name}"
  }
}