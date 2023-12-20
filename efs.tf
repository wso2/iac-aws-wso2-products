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

module "efs" {
  source         = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/EFS"
  count          = var.enable_efs_access_point ? 1 : 0
  project        = var.project
  environment    = var.environment_name
  region         = var.region
  application    = var.client_name
  creation_token = var.efs_creation_token
  efs_mount_targets = {
    "eks_az1_subnet" : {
      subnet_id : module.eks_cluster.eks_subnet_ids[0]
      security_groups : [module.eks_cluster_efs_access_group.security_group_id]
    },
    "eks_az2_subnet" : {
      subnet_id : module.eks_cluster.eks_subnet_ids[1]
      security_groups : [module.eks_cluster_efs_access_group.security_group_id]
    }
  }
}

module "efs_access_point" {
  source         = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/EFS-Access-Point"
  count          = var.enable_efs_access_point ? 1 : 0
  file_system_id = module.efs[0].efs_id
  posix_user_gid = var.efs_posix_user_gid
  posix_user_uid = var.efs_posix_user_uid
  permissions    = var.efs_permissions

  root_directory_path = var.efs_root_directory_path

  owner_gid   = var.efs_owner_gid
  owner_uid   = var.efs_owner_uid
  tags        = var.default_tags
}

module "eks_cluster_efs_access_group" {
  source      = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Security-Group"
  project     = var.project
  environment = var.environment_name
  region      = var.region
  application = "${var.client_name}-eks"
  description = "Allow Traffic to EFS"
  vpc_id      = module.vpc.vpc_id
  rules = [
    {
      "direction" : "ingress"
      "from_port" : 2049
      "to_port" : 2049
      "protocol" : "TCP"
      "cidr_blocks" : [var.eks_availability_zone_1_subnet_cidr_block, var.eks_availability_zone_2_subnet_cidr_block]
      "security_groups" : []
    }
  ]
  tags = var.default_tags
  depends_on = [
    module.vpc
  ]
}
