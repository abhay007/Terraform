variable "vpcid" {
	type = "string"
	default = "vpc-c2f948a6"
}

resource "aws_security_group" "terraform_ec2_sg_module" {
  name        = "terraform_ec2_sg_module"
  description = "terraform course sg for ec2 instance"
  vpc_id      = "${var.vpcid}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

variable "amiid" {
	default = "ami-047bb4163c506cd98"
}

resource "aws_instance" "terraform_ec2_instance" {
  ami           = "${var.amiid}"
  instance_type = "t2.micro"
  key_name = "terraform-course"
  vpc_security_group_ids = ["${aws_security_group.terraform_ec2_sg_module.id}"]
 
  tags {
    Name = "Terraform Ec2 Instance"
  }
}