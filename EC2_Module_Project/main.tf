provider "aws" {
	region = "eu-west-1"
	profile = "srathan-terraformcourse"
}

module "ec2_module" {
	source = "./ec2_module"
}