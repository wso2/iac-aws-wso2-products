# -------------------------------------------------------------------------------------
#
# Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com). All Rights Reserved.
#
# This software is the property of WSO2 LLC. and its suppliers, if any.
# Dissemination of any information or reproduction of any material contained
# herein in any form is strictly forbidden, unless permitted by WSO2 expressly.
# You may not alter or remove any copyright or other notice from copies of this content.
#
# --------------------------------------------------------------------------------------

module "bastion" {
  source                       = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/EC2-Instance"
  project                      = var.project
  environment                  = var.environment_name
  region                       = var.region
  application                  = var.client_name
  ec2_vpc_id                   = module.vpc.vpc_id
  use_existing_subnet          = false
  availability_zone            = data.aws_availability_zones.available.names[1]
  tags                         = var.default_tags
  ec2_ami                      = var.bastion_ami
  ec2_instance_type            = var.bastion_instance_type
  vpc_subnet_id                = module.management_az_subnet.subnet_id
  ip_type                      = "Private"
  ip_address_allocation_method = "Static"
  private_ip                   = var.bastion_ip_address
  add_ssh_key                  = false
  security_group_ids           = [module.bastion_security_group.security_group_id]
  ec2_subnet_vpc_cidr_block    = var.bastion_cidr_block
  custom_routes = [
    {
      "cidr_block" = "0.0.0.0/0"
      "ep_type"    = "nat_gateway_id"
      "ep_id"      = module.nat_gateway.nat_gateway_id
    }
  ]

  depends_on = [
    module.bastion_security_group,
    module.nat_gateway,
    module.vpc
  ]
}

module "bastion_security_group" {
  source      = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Security-Group"
  project     = var.project
  environment = var.environment_name
  region      = var.region
  application = "${var.client_name}-bastion"
  description = "Allow Traffic from Bastion"
  vpc_id      = module.vpc.vpc_id
  rules       = var.bastion_access_security_group_rules
  tags        = var.default_tags
  depends_on  = []
}
