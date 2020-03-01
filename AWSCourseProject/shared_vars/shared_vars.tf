output "vpcid"{
	value = "${local.vpcid}"
}

output "publicsubnetid1"{
	value = "${local.publicsubnetid1}"
}

output "publicsubnetid2"{
	value = "${local.publicsubnetid2}"
}

output "privatesubnetid"{
	value = "${local.privatesubnetid}"
}

output "env_suffix"{
	value = "${local.env}"
}

locals {
	env = "${terraform.workspace}"

	vpcid_env {
		default = "vpc-b050a4d9"
		staging = "vpc-b050a4d9"
		production = "vpc-b050a4d9"
	}
	vpcid = "${lookup(local.vpcid_env, local.env)}"

	publicsubnetid1_env {
		default = "subnet-4268942b"
		staging = "subnet-4268942b"
		production = "subnet-4268942b"
	}
	publicsubnetid1 = "${lookup(local.publicsubnetid1_env, local.env)}"

	publicsubnetid2_env {
		default = "subnet-d65d699c"
		staging = "subnet-d65d699c"
		production = "subnet-d65d699c"
	}
	publicsubnetid2 = "${lookup(local.publicsubnetid2_env, local.env)}"

	privatesubnetid_env {
		default = "subnet-9c9387e4"
		staging = "subnet-9c9387e4"
		production = "subnet-9c9387e4"
	}
	privatesubnetid = "${lookup(local.privatesubnetid_env, local.env)}"
}