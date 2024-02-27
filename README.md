# Terraform Configuration for WSO2 Products

This repository contains the Terraform scripts to provision AWS resources for WSO2 products.

## Prerequisites

Before you begin, ensure you have the following installed:
- Terraform >= 1.3.8
- AWS Provider ~> 5.0
- AWS CLI
- Proper AWS credentials configured

## Configuration

To configure the AWS resources, you need to perform the following steps:

1. Navigate to the `sample` directory.
2. Copy the `input.auto.tfvars` and `secrets.auto.tfvars` files from the `sample` directory to the root of the project.

```sh
   cp sample/input.tfvars
   cp sample/secrets.tfvars
   ```

3. Review and update the input.tfvars and secrets.tfvars files with the appropriate values for your environment.


## Deployment
To deploy the AWS resources:

1. Initialize Terraform to download and configure the providers.

```sh
   terraform init
   ```

2. Review the Terraform execution plan to ensure the configurations are as expected.

```sh
   terraform plan
   ```

3. Apply the configuration to provision the AWS resources.

```sh
   terraform apply
   ```

Please ensure the secrets.tfvars file is kept secure and is not committed to your version control system.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alert_group"></a> [alert\_group](#module\_alert\_group) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/SNS-Topic | n/a |
| <a name="module_aurora_mysql_rds_cluster"></a> [aurora\_mysql\_rds\_cluster](#module\_aurora\_mysql\_rds\_cluster) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/RDS-Aurora | n/a |
| <a name="module_bastion"></a> [bastion](#module\_bastion) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/EC2-Instance | n/a |
| <a name="module_bastion_security_group"></a> [bastion\_security\_group](#module\_bastion\_security\_group) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Security-Group | n/a |
| <a name="module_db_az1_subnet"></a> [db\_az1\_subnet](#module\_db\_az1\_subnet) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/VPC-Subnet | n/a |
| <a name="module_db_az2_subnet"></a> [db\_az2\_subnet](#module\_db\_az2\_subnet) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/VPC-Subnet | n/a |
| <a name="module_db_security_group"></a> [db\_security\_group](#module\_db\_security\_group) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Security-Group | n/a |
| <a name="module_db_subnet_group"></a> [db\_subnet\_group](#module\_db\_subnet\_group) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/RDS-Subnet-Group | n/a |
| <a name="module_ec2_messages_vpc_endpoint"></a> [ec2\_messages\_vpc\_endpoint](#module\_ec2\_messages\_vpc\_endpoint) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Interface-VPC-Endpoint | n/a |
| <a name="module_efs"></a> [efs](#module\_efs) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/EFS | n/a |
| <a name="module_efs_access_point"></a> [efs\_access\_point](#module\_efs\_access\_point) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/EFS-Access-Point | n/a |
| <a name="module_eks_cluster"></a> [eks\_cluster](#module\_eks\_cluster) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/eks_cluster | n/a |
| <a name="module_eks_cluster_bastion_access_sg_rule"></a> [eks\_cluster\_bastion\_access\_sg\_rule](#module\_eks\_cluster\_bastion\_access\_sg\_rule) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Security-Group-Rule | n/a |
| <a name="module_eks_cluster_container_cpu_utilization_warning_alert"></a> [eks\_cluster\_container\_cpu\_utilization\_warning\_alert](#module\_eks\_cluster\_container\_cpu\_utilization\_warning\_alert) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Metric-Alarm | n/a |
| <a name="module_eks_cluster_container_memory_utilization_warning_alert"></a> [eks\_cluster\_container\_memory\_utilization\_warning\_alert](#module\_eks\_cluster\_container\_memory\_utilization\_warning\_alert) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Metric-Alarm | n/a |
| <a name="module_eks_cluster_container_restarts_warning_alert"></a> [eks\_cluster\_container\_restarts\_warning\_alert](#module\_eks\_cluster\_container\_restarts\_warning\_alert) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Metric-Alarm | n/a |
| <a name="module_eks_cluster_efs_access_group"></a> [eks\_cluster\_efs\_access\_group](#module\_eks\_cluster\_efs\_access\_group) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Security-Group | n/a |
| <a name="module_eks_cluster_node_cpu_utilization_warning_alert"></a> [eks\_cluster\_node\_cpu\_utilization\_warning\_alert](#module\_eks\_cluster\_node\_cpu\_utilization\_warning\_alert) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Metric-Alarm | n/a |
| <a name="module_eks_cluster_node_group"></a> [eks\_cluster\_node\_group](#module\_eks\_cluster\_node\_group) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/EKS-Node-Group | n/a |
| <a name="module_eks_cluster_node_memory_utilization_warning_alert"></a> [eks\_cluster\_node\_memory\_utilization\_warning\_alert](#module\_eks\_cluster\_node\_memory\_utilization\_warning\_alert) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Metric-Alarm | n/a |
| <a name="module_endpoint_security_group"></a> [endpoint\_security\_group](#module\_endpoint\_security\_group) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Security-Group | n/a |
| <a name="module_internet_gateway"></a> [internet\_gateway](#module\_internet\_gateway) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Gateway | n/a |
| <a name="module_nat_gateway_subnet"></a> [internet\_gateway\_subnet](#module\_internet\_gateway\_subnet) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/VPC-Subnet | n/a |
| <a name="module_nat_gateway_subnet_routes"></a> [internet\_gateway\_subnet\_routes](#module\_internet\_gateway\_subnet\_routes) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/VPC-Subnet-Routes | n/a |
| <a name="module_management_az_subnet"></a> [management\_az\_subnet](#module\_management\_az\_subnet) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/VPC-Subnet | n/a |
| <a name="module_nat_gateway"></a> [nat\_gateway](#module\_nat\_gateway) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/nat_gateway | n/a |
| <a name="module_secret"></a> [secret](#module\_secret) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Secret-Manager-Secret | n/a |
| <a name="module_ssm_messages_vpc_endpoint"></a> [ssm\_messages\_vpc\_endpoint](#module\_ssm\_messages\_vpc\_endpoint) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Interface-VPC-Endpoint | n/a |
| <a name="module_ssm_vpc_endpoint"></a> [ssm\_vpc\_endpoint](#module\_ssm\_vpc\_endpoint) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Interface-VPC-Endpoint | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/VPC | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alert_subscribers"></a> [alert\_subscribers](#input\_alert\_subscribers) | List of emails to be notified when a warning alert is triggered | `any` | n/a | yes |
| <a name="input_az_dmz_subnet_cidr_block"></a> [az1\_dmz\_subnet\_cidr\_block](#input\_az1\_dmz\_subnet\_cidr\_block) | CIDR range for subnet that holds Firewalls and Public Load Balancers in AZ | `string` | n/a | yes |
| <a name="input_bastion_access_security_group_rules"></a> [bastion\_access\_security\_group\_rules](#input\_bastion\_access\_security\_group\_rules) | List of rules to allow/deny access to the Bastion | `any` | n/a | yes |
| <a name="input_bastion_ami"></a> [bastion\_ami](#input\_bastion\_ami) | AMI to be used for Bastion | `string` | n/a | yes |
| <a name="input_bastion_instance_type"></a> [bastion\_instance\_type](#input\_bastion\_instance\_type) | Instance type to be used for Bastion | `string` | n/a | yes |
| <a name="input_bastion_ip_address"></a> [bastion\_ip\_address](#input\_bastion\_ip\_address) | IP address of the Bastion | `string` | n/a | yes |
| <a name="input_client_name"></a> [client\_name](#input\_client\_name) | Name of the Client. Used to separate client deployments | `string` | n/a | yes |
| <a name="input_db_access_security_group_rules"></a> [db\_access\_security\_group\_rules](#input\_db\_access\_security\_group\_rules) | List of rules to allow/deny access to the Database | `any` | n/a | yes |
| <a name="input_db_az1_subnet_cidr_block"></a> [db\_az1\_subnet\_cidr\_block](#input\_db\_az1\_subnet\_cidr\_block) | CIDR range for subnet that holds the Database in AZ1 | `string` | n/a | yes |
| <a name="input_db_az2_subnet_cidr_block"></a> [db\_az2\_subnet\_cidr\_block](#input\_db\_az2\_subnet\_cidr\_block) | CIDR range for subnet that holds the Database in AZ2 | `string` | n/a | yes |
| <a name="input_db_engine"></a> [db\_engine](#input\_db\_engine) | Database engine to be used | `string` | n/a | yes |
| <a name="input_db_engine_mode"></a> [db\_engine\_mode](#input\_db\_engine\_mode) | Database engine mode to be used | `string` | n/a | yes |
| <a name="input_db_engine_version"></a> [db\_engine\_version](#input\_db\_engine\_version) | Database engine version to be used | `string` | n/a | yes |
| <a name="input_db_instance_size"></a> [db\_instance\_size](#input\_db\_instance\_size) | Database instance size to be used | `string` | n/a | yes |
| <a name="input_db_master_username"></a> [db\_master\_username](#input\_db\_master\_username) | Master username to be used in MySQL DB | `string` | n/a | yes |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | Password for the Database | `string` | n/a | yes |
| <a name="input_db_primary_db_name"></a> [db\_primary\_db\_name](#input\_db\_primary\_db\_name) | Primary Database name to be used in MySQL DB | `string` | n/a | yes |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Default tags to be applied to all resources | `map(string)` | n/a | yes |
| <a name="input_bastion_cidr_block"></a> [ec2\_subnet\_vpc\_cidr\_block](#input\_ec2\_subnet\_vpc\_cidr\_block) | CIDR of the subnet which should contain the VM | `string` | `null` | no |
| <a name="input_efs_creation_token"></a> [efs\_creation\_token](#input\_efs\_creation\_token) | Token used for setting up the EFS | `string` | n/a | yes |
| <a name="input_efs_owner_gid"></a> [efs\_owner\_gid](#input\_efs\_owner\_gid) | The group ID for the root directory owner. | `number` | `802` | no |
| <a name="input_efs_owner_uid"></a> [efs\_owner\_uid](#input\_efs\_owner\_uid) | The user ID for the root directory owner. | `number` | `802` | no |
| <a name="input_efs_permissions"></a> [efs\_permissions](#input\_efs\_permissions) | The permissions for the root directory. | `string` | `"0755"` | no |
| <a name="input_efs_posix_user_gid"></a> [efs\_posix\_user\_gid](#input\_efs\_posix\_user\_gid) | The group ID for the POSIX-compatible user. | `number` | `802` | no |
| <a name="input_efs_posix_user_uid"></a> [efs\_posix\_user\_uid](#input\_efs\_posix\_user\_uid) | The user ID for the POSIX-compatible user. | `number` | `802` | no |
| <a name="input_efs_root_directory_path"></a> [efs\_root\_directory\_path](#input\_efs\_root\_directory\_path) | The permissions for the root directory. | `string` | n/a | yes |
| <a name="input_eks_availability_zone_1_subnet_cidr_block"></a> [eks\_availability\_zone\_1\_subnet\_cidr\_block](#input\_eks\_availability\_zone\_1\_subnet\_cidr\_block) | CIDR range for subnet that holds the First EKS cluster in AZ1 | `string` | n/a | yes |
| <a name="input_eks_availability_zone_2_subnet_cidr_block"></a> [eks\_availability\_zone\_2\_subnet\_cidr\_block](#input\_eks\_availability\_zone\_2\_subnet\_cidr\_block) | CIDR range for subnet that holds the First EKS cluster in AZ2 | `string` | n/a | yes |
| <a name="input_eks_cluster_container_cpu_utilization_warning_threshold"></a> [eks\_cluster\_container\_cpu\_utilization\_warning\_threshold](#input\_eks\_cluster\_container\_cpu\_utilization\_warning\_threshold) | Warning threshold for container CPU utilization in percentage. | `number` | n/a | yes |
| <a name="input_eks_cluster_container_memory_utilization_warning_threshold"></a> [eks\_cluster\_container\_memory\_utilization\_warning\_threshold](#input\_eks\_cluster\_container\_memory\_utilization\_warning\_threshold) | Warning threshold for container memory utilization in percentage. | `number` | n/a | yes |
| <a name="input_eks_cluster_container_restart_warning_threshold"></a> [eks\_cluster\_container\_restart\_warning\_threshold](#input\_eks\_cluster\_container\_restart\_warning\_threshold) | Warning threshold for container restarts. | `number` | n/a | yes |
| <a name="input_eks_cluster_enable_monitoring_global_flag"></a> [eks\_cluster\_enable\_monitoring\_global\_flag](#input\_eks\_cluster\_enable\_monitoring\_global\_flag) | Flag to enable global monitoring for the EKS cluster. | `bool` | n/a | yes |
| <a name="input_eks_cluster_node_cpu_utilization_warning_threshold"></a> [eks\_cluster\_node\_cpu\_utilization\_warning\_threshold](#input\_eks\_cluster\_node\_cpu\_utilization\_warning\_threshold) | Warning threshold for node CPU utilization in percentage. | `number` | n/a | yes |
| <a name="input_eks_cluster_node_memory_utilization_warning_threshold"></a> [eks\_cluster\_node\_memory\_utilization\_warning\_threshold](#input\_eks\_cluster\_node\_memory\_utilization\_warning\_threshold) | Warning threshold for node memory utilization in percentage. | `number` | n/a | yes |
| <a name="input_eks_default_nodepool_desired_size"></a> [eks\_default\_nodepool\_desired\_size](#input\_eks\_default\_nodepool\_desired\_size) | Desired number of nodes in the default node pool for the First EKS Cluster | `number` | n/a | yes |
| <a name="input_eks_default_nodepool_max_size"></a> [eks\_default\_nodepool\_max\_size](#input\_eks\_default\_nodepool\_max\_size) | Maximum number of nodes in the default node pool for the First EKS Cluster | `number` | n/a | yes |
| <a name="input_eks_default_nodepool_max_unavailable"></a> [eks\_default\_nodepool\_max\_unavailable](#input\_eks\_default\_nodepool\_max\_unavailable) | Maximum number of nodes that can be unavailable in the default node pool for the First EKS Cluster | `number` | n/a | yes |
| <a name="input_eks_default_nodepool_min_size"></a> [eks\_default\_nodepool\_min\_size](#input\_eks\_default\_nodepool\_min\_size) | Minimum number of nodes in the default node pool for the First EKS Cluster | `number` | n/a | yes |
| <a name="input_eks_external_lb_az1_subnet_cidr"></a> [eks\_external\_lb\_az1\_subnet\_cidr](#input\_eks\_external\_lb\_az1\_subnet\_cidr) | CIDR range for subnet that holds the Internal Load Balancers in AZ1 | `string` | n/a | yes |
| <a name="input_eks_external_lb_az2_subnet_cidr"></a> [eks\_external\_lb\_az2\_subnet\_cidr](#input\_eks\_external\_lb\_az2\_subnet\_cidr) | CIDR range for subnet that holds the Internal Load Balancers in AZ2 | `string` | n/a | yes |
| <a name="input_eks_instance_types"></a> [eks\_instance\_types](#input\_eks\_instance\_types) | n/a | `any` | n/a | yes |
| <a name="input_eks_service_ipv4_cidr"></a> [eks\_service\_ipv4\_cidr](#input\_eks\_service\_ipv4\_cidr) | CIDR range for EKS K8S services | `string` | n/a | yes |
| <a name="input_enable_database"></a> [enable\_database](#input\_enable\_database) | Set true to enable the creation of a MySQL database. | `bool` | `true` | no |
| <a name="input_enable_efs_access_point"></a> [enable\_efs\_access\_point](#input\_enable\_efs\_access\_point) | Deploy a EFS access point for persistent storage | `bool` | `true` | no |
| <a name="input_enable_secret"></a> [enable\_secret](#input\_enable\_secret) | Enable secrets to store passwords | `bool` | `true` | no |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | Name used to identify Resources of the development resources | `string` | n/a | yes |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Kubernetes version to be used in EKS clusters | `string` | n/a | yes |
| <a name="input_management_subnet_az_cidr"></a> [management\_subnet\_az\_cidr](#input\_management\_subnet\_az\_cidr) | CIDR range for subnet that holds the Transit Gateway attachment in AZ1 | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Name of the project. Used for naming | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Deployment region | `string` | n/a | yes |
| <a name="input_secret_name"></a> [secret\_name](#input\_secret\_name) | Secret name for string | `string` | n/a | yes |
| <a name="input_secret_recovery_window_in_days"></a> [secret\_recovery\_window\_in\_days](#input\_secret\_recovery\_window\_in\_days) | Recovery window of the secret | `number` | n/a | yes |
| <a name="input_secret_string"></a> [secret\_string](#input\_secret\_string) | String value for string | `string` | n/a | yes |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | CIDR range for VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bastion_instance"></a> [bastion\_instance](#output\_bastion\_instance) | ID of the bastion instance. |
| <a name="output_database_writer_endpoint"></a> [database\_writer\_endpoint](#output\_database\_writer\_endpoint) | Writer endpoint of the database instance. |
| <a name="output_efs_efs_access_point"></a> [efs\_efs\_access\_point](#output\_efs\_efs\_access\_point) | ID of the EFS Access Point |
| <a name="output_efs_id"></a> [efs\_id](#output\_efs\_id) | ID of the Elastic File Storage |
| <a name="output_filestore_location"></a> [filestore\_location](#output\_filestore\_location) | Location of the filestore. |
