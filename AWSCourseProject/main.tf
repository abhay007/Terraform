provider "aws" {
	profile = "srathan-terraformcourse"
	region = "us-east-2"
}

module "network_module"{
	source = "./network_module"
}

module "loadbalancer_module"{
	source = "./loadbalancer_module"
	publicsg_id = "${module.network_module.publicsg_id}"
}

module "autoscaling_module"{
	source = "./autoscaling_module"
	privatesg_id = "${module.network_module.privatesg_id}"
	tg_arn = "${module.loadbalancer_module.tg_arn}"
}