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

module "aurora_mysql_rds_cluster" {
  source             = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/RDS-Aurora"
  project            = var.project
  environment        = var.environment_name
  region             = var.region
  application        = var.client_name
  availability_zones = [data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1]]
  cluster_instances = {
    "1" : {
      "name" : "instance-1"
      "instance_class" : var.db_instance_size
    }
  }
  database_name           = var.db_primary_db_name
  master_username         = var.db_master_username
  master_password         = var.db_password
  engine                  = var.db_engine
  engine_version          = var.db_engine_version
  engine_mode             = var.db_engine_mode
  db_subnet_group_name    = module.db_subnet_group.subnet_group_name
  backup_retention_period = 7
  vpc_security_group_ids  = [module.db_security_group.security_group_id]
}

module "db_subnet_group" {
  source      = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/RDS-Subnet-Group"
  project     = var.project
  environment = var.environment_name
  region      = var.region
  application = var.client_name
  subnet_ids  = [module.db_az1_subnet.subnet_id, module.db_az2_subnet.subnet_id]
}

module "db_security_group" {
  source      = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Security-Group"
  project     = var.project
  environment = var.environment_name
  region      = var.region
  application = "${var.client_name}-db"
  description = "Allow Traffic to Database"
  vpc_id      = module.vpc.vpc_id
  rules       = var.db_access_security_group_rules
  tags        = var.default_tags
  depends_on = [
    module.vpc
  ]
}

module "db_az1_subnet" {
  source            = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/VPC-Subnet"
  project           = var.project
  environment       = var.environment_name
  region            = var.region
  application       = join("-", [var.client_name, "db"])
  availability_zone = data.aws_availability_zones.available.names[0]
  cidr_block        = var.db_az1_subnet_cidr_block
  vpc_id            = module.vpc.vpc_id
  custom_routes     = []
  tags              = var.default_tags
}

module "db_az2_subnet" {
  source            = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/VPC-Subnet"
  project           = var.project
  environment       = var.environment_name
  region            = var.region
  application       = join("-", [var.client_name, "db"])
  availability_zone = data.aws_availability_zones.available.names[1]
  cidr_block        = var.db_az2_subnet_cidr_block
  vpc_id            = module.vpc.vpc_id
  custom_routes     = []
  tags              = var.default_tags
}
