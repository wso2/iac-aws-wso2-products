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

module "vpc" {
  source               = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/VPC"
  project              = var.project
  environment          = var.environment_name
  region               = var.region
  application          = var.client_name
  enable_dns_hostnames = true
  vpc_cidr_block       = var.vpc_cidr_block
  tags                 = var.default_tags
}

module "internet_gateway" {
  source      = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Gateway"
  project     = var.project
  environment = var.environment_name
  region      = var.region
  application = var.client_name
  tags        = var.default_tags
  vpc_ids     = [module.vpc.vpc_id]

  depends_on = [
    module.vpc
  ]
}

module "nat_gateway_subnet" {
  source            = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/VPC-Subnet"
  project           = var.project
  environment       = var.environment_name
  region            = var.region
  application       = join("-", [var.client_name, "dmz"])
  availability_zone = data.aws_availability_zones.available.names[1]
  cidr_block        = var.az_dmz_subnet_cidr_block
  vpc_id            = module.vpc.vpc_id
  custom_routes     = []
  tags              = merge(var.default_tags, { "kubernetes.io/role/elb" : 1 })
}

module "nat_gateway_subnet_routes" {
  source         = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/VPC-Subnet-Routes"
  route_table_id = module.nat_gateway_subnet.route_table_id
  routes = [
    {
      "cidr_block" = "0.0.0.0/0"
      "ep_type"    = "gateway_id"
      "ep_id"      = module.internet_gateway.gateway_id
    }
  ]
  depends_on = [
    module.internet_gateway
  ]
}

module "nat_gateway" {
  source      = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/NAT-Gateway"
  project     = var.project
  environment = var.environment_name
  region      = var.region
  application = var.client_name
  tags        = var.default_tags
  subnet_id   = module.nat_gateway_subnet.subnet_id

  depends_on = [
    module.internet_gateway
  ]
}

module "management_az_subnet" {
  source            = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/VPC-Subnet"
  project           = var.project
  environment       = var.environment_name
  region            = var.region
  application       = join("-", [var.client_name, "mgmt-attachment"])
  availability_zone = data.aws_availability_zones.available.names[1]
  cidr_block        = var.management_subnet_az_cidr
  vpc_id            = module.vpc.vpc_id
  tags              = var.default_tags
  custom_routes = [
    {
      "cidr_block" = "0.0.0.0/0"
      "ep_type"    = "nat_gateway_id"
      "ep_id"      = module.nat_gateway.nat_gateway_id
    }
  ]
}

module "ec2_messages_vpc_endpoint" {
  source                       = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Interface-VPC-Endpoint"
  vpc_id                       = module.vpc.vpc_id
  service_name                 = "com.amazonaws.${var.region}.ec2messages"
  project                      = var.project
  environment                  = var.environment_name
  region                       = var.region
  application                  = var.client_name
  service_short_hand_name      = "ec2msg"
  subnet_ids                   = [module.management_az_subnet.subnet_id]
  endpoint_private_dns_enabled = true
  endpoint_security_group_ids  = [module.endpoint_security_group.security_group_id]
  tags                         = var.default_tags
}

module "ssm_messages_vpc_endpoint" {
  source                       = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Interface-VPC-Endpoint"
  vpc_id                       = module.vpc.vpc_id
  service_name                 = "com.amazonaws.${var.region}.ssmmessages"
  project                      = var.project
  environment                  = var.environment_name
  region                       = var.region
  application                  = var.client_name
  service_short_hand_name      = "ssmmsg"
  subnet_ids                   = [module.management_az_subnet.subnet_id]
  endpoint_private_dns_enabled = true
  endpoint_security_group_ids  = [module.endpoint_security_group.security_group_id]
  tags                         = var.default_tags
}

module "ssm_vpc_endpoint" {
  source                       = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Interface-VPC-Endpoint"
  project                      = var.project
  environment                  = var.environment_name
  region                       = var.region
  application                  = var.client_name
  service_short_hand_name      = "ssm"
  vpc_id                       = module.vpc.vpc_id
  service_name                 = "com.amazonaws.${var.region}.ssm"
  subnet_ids                   = [module.management_az_subnet.subnet_id]
  endpoint_private_dns_enabled = true
  endpoint_security_group_ids  = [module.endpoint_security_group.security_group_id]
  tags                         = var.default_tags
}

module "endpoint_security_group" {
  source      = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Security-Group"
  project     = var.project
  environment = var.environment_name
  region      = var.region
  application = "${var.client_name}-vpc-endpoints"
  description = "Allow Traffic from Bastion to VPC endpoints"
  vpc_id      = module.vpc.vpc_id
  rules = [
    {
      "direction" : "ingress"
      "from_port" : 443
      "to_port" : 443
      "protocol" : "-1"
      "cidr_blocks" : ["${var.bastion_ip_address}/32"]
      "security_groups" : []
    }
  ]
  tags       = var.default_tags
  depends_on = []
}