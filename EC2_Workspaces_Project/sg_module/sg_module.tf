variable "vpcid" {
	type = "string"
	default = "vpc-c2f948a6"
}

module "shared_vars"{
  source = "../shared_vars"
}

resource "aws_security_group" "sg_module_creation" {
  name        = "sg_ec2_${module.shared_vars.env_suffix}"
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

output "sg_id_output" {
  value = "${aws_security_group.sg_module_creation.id}"
}