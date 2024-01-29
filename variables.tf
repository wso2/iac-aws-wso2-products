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

# Common Network resources
variable "vpc_cidr_block" {
  type        = string
  description = "CIDR range for VPC"
}

variable "management_subnet_az_cidr" {
  type        = string
  description = "CIDR range for subnet that holds the Transit Gateway attachment in AZ1"
}

# Dev EKS 1
variable "eks_availability_zone_1_subnet_cidr_block" {
  type        = string
  description = "CIDR range for subnet that holds the First EKS cluster in AZ1"
}

variable "eks_availability_zone_2_subnet_cidr_block" {
  type        = string
  description = "CIDR range for subnet that holds the First EKS cluster in AZ2"
}

variable "eks_default_nodepool_desired_size" {
  type        = number
  description = "Desired number of nodes in the default node pool for the First EKS Cluster"
}

variable "eks_default_nodepool_max_size" {
  type        = number
  description = "Maximum number of nodes in the default node pool for the First EKS Cluster"
}

variable "eks_default_nodepool_min_size" {
  type        = number
  description = "Minimum number of nodes in the default node pool for the First EKS Cluster"
}

variable "eks_default_nodepool_max_unavailable" {
  type        = number
  description = "Maximum number of nodes that can be unavailable in the default node pool for the First EKS Cluster"
}

variable "eks_instance_types" {}

variable "eks_service_ipv4_cidr" {
  type        = string
  description = "CIDR range for EKS K8S services"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version to be used in EKS clusters"
}

variable "az_dmz_subnet_cidr_block" {
  type        = string
  description = "CIDR range for subnet that holds Firewalls and Public Load Balancers in AZ"
}

variable "eks_external_lb_az1_subnet_cidr" {
  type        = string
  description = "CIDR range for subnet that holds the Internal Load Balancers in AZ1"
}

variable "eks_external_lb_az2_subnet_cidr" {
  type        = string
  description = "CIDR range for subnet that holds the Internal Load Balancers in AZ2"
}

# Database
variable "enable_database" {
  default     = true
  description = "Set true to enable the creation of a MySQL database."
  type        = bool
}

variable "db_engine" {
  type        = string
  description = "Database engine to be used"
}

variable "db_engine_mode" {
  type        = string
  description = "Database engine mode to be used"
}

variable "db_engine_version" {
  type        = string
  description = "Database engine version to be used"
}

variable "db_instance_size" {
  type        = string
  description = "Database instance size to be used"
}

variable "db_primary_db_name" {
  type        = string
  description = "Primary Database name to be used in MySQL DB"
}

variable "db_master_username" {
  type        = string
  description = "Master username to be used in MySQL DB"
}

variable "db_access_security_group_rules" {
  description = "List of rules to allow/deny access to the Database"
}

variable "db_az1_subnet_cidr_block" {
  type        = string
  description = "CIDR range for subnet that holds the Database in AZ1"
}

variable "db_az2_subnet_cidr_block" {
  type        = string
  description = "CIDR range for subnet that holds the Database in AZ2"
}

variable "db_password" {
  type        = string
  description = "Password for the Database"
  sensitive   = true
}

# EFS
variable "enable_efs_access_point" {
  description = "Deploy a EFS access point for persistent storage"
  type        = bool
  default     = true
}

variable "efs_creation_token" {
  type        = string
  description = "Token used for setting up the EFS"
  sensitive   = true
}

variable "efs_posix_user_gid" {
  default     = 802
  description = "The group ID for the POSIX-compatible user."
  type        = number
}

variable "efs_posix_user_uid" {
  default     = 802
  description = "The user ID for the POSIX-compatible user."
  type        = number
}

variable "efs_owner_gid" {
  default     = 802
  description = "The group ID for the root directory owner."
  type        = number
}

variable "efs_owner_uid" {
  default     = 802
  description = "The user ID for the root directory owner."
  type        = number
}

variable "efs_permissions" {
  default     = "0755"
  description = "The permissions for the root directory."
  type        = string
}

variable "efs_root_directory_path" {
  description = "The permissions for the root directory."
  type        = string
}

# Secret
variable "enable_secret" {
  description = "Enable secrets to store passwords"
  type        = bool
  default     = true
}

variable "secret_string" {
  type        = string
  description = "String value for string"
}

variable "secret_name" {
  type        = string
  description = "Secret name for string"
}

variable "secret_recovery_window_in_days" {
  type        = number
  description = "Recovery window of the secret"
}

# Alerts
variable "eks_cluster_enable_monitoring_global_flag" {
  type        = bool
  description = "Flag to enable global monitoring for the EKS cluster."
}

variable "eks_cluster_node_cpu_utilization_warning_threshold" {
  type        = number
  description = "Warning threshold for node CPU utilization in percentage."
}

variable "eks_cluster_node_memory_utilization_warning_threshold" {
  type        = number
  description = "Warning threshold for node memory utilization in percentage."
}

variable "eks_cluster_container_cpu_utilization_warning_threshold" {
  type        = number
  description = "Warning threshold for container CPU utilization in percentage."
}

variable "eks_cluster_container_memory_utilization_warning_threshold" {
  type        = number
  description = "Warning threshold for container memory utilization in percentage."
}

variable "eks_cluster_container_restart_warning_threshold" {
  type        = number
  description = "Warning threshold for container restarts."
}

variable "alert_subscribers" {
  description = "List of emails to be notified when a warning alert is triggered"
}

# Management Variables
variable "project" {
  type        = string
  description = "Name of the project. Used for naming"
}

variable "environment_name" {
  type        = string
  description = "Name used to identify Resources of the development resources"
}

variable "client_name" {
  type        = string
  description = "Name of the Client. Used to separate client deployments"
}

variable "region" {
  type        = string
  description = "Deployment region"
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags to be applied to all resources"
}

variable "bastion_access_security_group_rules" {
  description = "List of rules to allow/deny access to the Bastion"
}

variable "bastion_ami" {
  type        = string
  description = "AMI to be used for Bastion"
}

variable "bastion_instance_type" {
  type        = string
  description = "Instance type to be used for Bastion"
}

variable "bastion_ip_address" {
  type        = string
  description = "IP address of the Bastion"
}

variable "bastion_cidr_block" {
  type        = string
  description = "CIDR of the subnet which should contain the VM"
  default     = null
}
