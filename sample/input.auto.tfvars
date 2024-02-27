# -------------------------------------------------------------------------------------
#
# Copyright (c) 2024, WSO2 LLC. (http://www.wso2.com). All Rights Reserved.
#
# This software is the property of WSO2 LLC. and its suppliers, if any.
# Dissemination of any information or reproduction of any material contained
# herein in any form is strictly forbidden, unless permitted by WSO2 expressly.
# You may not alter or remove any copyright or other notice from copies of this content.
#
# --------------------------------------------------------------------------------------

project     = "wso2"
region      = "us-west-1"
client_name = "dev"

default_tags = {
  user : "user@wso2.com"
}

environment_name = "dev"
vpc_cidr_block   = "172.17.0.0/16"

bastion_access_security_group_rules = [
  {
    "direction" : "egress"
    "from_port" : 0
    "to_port" : 0
    "protocol" : "-1"
    "cidr_blocks" : ["0.0.0.0/0"]
    "security_groups" : []
  }
]
bastion_ami           = "ami-05af0694d2e8e6df3"
bastion_instance_type = "t2.micro"
bastion_ip_address    = "172.17.10.10"
bastion_cidr_block    = "172.17.10.0/24"

management_subnet_az_cidr = "172.17.15.0/26"

eks_default_nodepool_desired_size         = "2"
eks_default_nodepool_max_size             = "3"
eks_default_nodepool_min_size             = "1"
eks_default_nodepool_max_unavailable      = "1"
eks_instance_types                        = ["c4.xlarge"]
eks_availability_zone_1_subnet_cidr_block = "172.17.16.0/24"
eks_availability_zone_2_subnet_cidr_block = "172.17.17.0/24"
eks_external_lb_az1_subnet_cidr           = "172.17.19.0/24"
eks_external_lb_az2_subnet_cidr           = "172.17.20.0/24"
eks_service_ipv4_cidr                     = "10.0.0.0/16"
az_dmz_subnet_cidr_block                  = "172.17.12.0/26"
kubernetes_version                        = "1.28"

efs_creation_token      = "token-2"
efs_root_directory_path = "/solr"

# DB
db_engine          = "aurora-mysql"
db_engine_mode     = "provisioned"
db_engine_version  = "8.0.mysql_aurora.3.02.2"
db_instance_size   = "db.t3.medium"
db_primary_db_name = "apimdb"
db_master_username = "wso2carbon"
db_access_security_group_rules = [
  {
    "direction" : "ingress"
    "from_port" : 0
    "to_port" : 3306
    "protocol" : "TCP"
    "cidr_blocks" : ["172.17.10.0/24"]
    "security_groups" : []
  },
  {
    "direction" : "ingress"
    "from_port" : 0
    "to_port" : 3306
    "protocol" : "TCP"
    "cidr_blocks" : ["172.17.16.0/24"]
    "security_groups" : []
  },
  {
    "direction" : "ingress"
    "from_port" : 0
    "to_port" : 3306
    "protocol" : "TCP"
    "cidr_blocks" : ["172.17.17.0/24"]
    "security_groups" : []
  }
]
db_az1_subnet_cidr_block   = "172.17.12.128/26"
db_az2_subnet_cidr_block   = "172.17.12.192/26"
db_password                = "wso2carbon"
db_backup_retention_period = 7

#secret
secret_name                    = "wso2-secret"
secret_string                  = "{\"secret\": \"wso2carbon\"}"
secret_recovery_window_in_days = 0

#alerts
eks_cluster_enable_monitoring_global_flag                  = true
eks_cluster_node_cpu_utilization_warning_threshold         = 80
eks_cluster_node_memory_utilization_warning_threshold      = 80
eks_cluster_container_cpu_utilization_warning_threshold    = 80
eks_cluster_container_memory_utilization_warning_threshold = 80
eks_cluster_container_restart_warning_threshold            = 20
alert_subscribers = [
  {
    "protocol" : "email"
    "endpoint" : "user@wso2.com"
  }
]
