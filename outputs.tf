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

output "bastion_instance" {
  description = "ID of the bastion instance."
  value       = module.bastion.ec2-instance-id
  depends_on  = [module.bastion]
}

output "database_writer_endpoint" {
  description = "Writer endpoint of the database instance."
  value       = length(module.aurora_mysql_rds_cluster) > 0 ? module.aurora_mysql_rds_cluster[0].database_writer_endpoint : null
  depends_on  = [module.aurora_mysql_rds_cluster]
}

output "efs_id" {
  value       = length(module.efs) > 0 ? module.efs[0].efs_id : null
  depends_on  = [module.efs]
  description = "ID of the Elastic File Storage"
}

output "efs_access_point" {
  value       = length(module.efs_access_point) > 0 ? module.efs_access_point[0].access_point_id : null
  depends_on  = [module.efs_access_point]
  description = "ID of the EFS Access Point"
}
