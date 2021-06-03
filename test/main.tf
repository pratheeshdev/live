#my main module for infra creation

module "mymodule" {
	source = "./modules/vpc_module"
}
module "mysgmodule"{
	source = "./modules/sg_module"
	vpc_id = module.mymodule.myoutput
}	
module "myec2module"{
	source = "./modules/ec2_module"
	subnet_id = module.mymodule.myoutput1
	vpc_security_group_ids = module.mysgmodule.mysgoutput
	instance_type = var.instance_type
}
