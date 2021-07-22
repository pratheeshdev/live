#my main module for infra creation

module "mymodule" {
	source = "github.com/pratheeshdev/modules/vpc_module"
}
module "mysgmodule"{
	source = "github.com/pratheeshdev/modules/sg_module"
	vpc_id = module.mymodule.myoutput
}	
module "myec2module"{
	source = "github.com/pratheeshdev/modules/ec2_module"
	subnet_id = module.mymodule.myoutput1
	vpc_security_group_ids = module.mysgmodule.mysgoutput
	instance_type = var.instance_type
}
module "myelbmodule"{
	source = "github.com/pratheeshdev/modules/elb_module"
	target_id = module.myec2module.myec2output
	subnets = module.mymodule.myoutput1
        vpc_id = module.mymodule.myoutput

}
