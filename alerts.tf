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

module "alert_group" {
  source      = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/SNS-Topic"
  count       = var.eks_cluster_enable_monitoring_global_flag ? 1 : 0
  topic_name  = "alert-group"
  subscribers = var.alert_subscribers
  project     = var.project
  environment = var.environment_name
  region      = var.region
  application = var.client_name
  tags        = var.default_tags
}

module "eks_cluster_node_cpu_utilization_warning_alert" {
  source              = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Metric-Alarm"
  enabled             = var.eks_cluster_enable_monitoring_global_flag
  tags                = var.default_tags
  metric_namespace    = local.eks_container_insights_metrics_namespace
  metric_name         = local.node_cpu_utilization_metric_name
  alarm_description   = "This alarm monitors VM CPU utilization in the cluster and triggers a warning alert"
  alarm_actions       = [module.alert-group.topic_arn]
  comparison_operator = local.cloud_watch_gte_metrics_threshold_string
  threshold           = var.eks_cluster_node_cpu_utilization_warning_threshold
  metric_usage_prefix = join("-", [local.node_cpu_utilization_metric_name_usage, local.warning_alert_usage_suffix])
  dimensions = {
    ClusterName = module.eks_cluster.eks_cluster_name
  }
  statistic   = local.cloud_watch_average_statistic_string
  project     = var.project
  environment = var.environment_name
  region      = var.region
  application = var.client_name
}

module "eks_cluster_node_memory_utilization_warning_alert" {
  source              = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Metric-Alarm"
  enabled             = var.eks_cluster_enable_monitoring_global_flag
  tags                = var.default_tags
  metric_namespace    = local.eks_container_insights_metrics_namespace
  metric_name         = local.node_memory_utilization_metric_name
  alarm_description   = "This alarm monitors VM Memory utilization in the cluster and triggers a warning alert"
  alarm_actions       = [module.alert-group.topic_arn]
  comparison_operator = local.cloud_watch_gte_metrics_threshold_string
  threshold           = var.eks_cluster_node_memory_utilization_warning_threshold
  metric_usage_prefix = join("-", [local.node_memory_utilization_metric_name_usage, local.warning_alert_usage_suffix])
  dimensions = {
    ClusterName = module.eks_cluster.eks_cluster_name
  }
  statistic   = local.cloud_watch_average_statistic_string
  project     = var.project
  environment = var.environment_name
  region      = var.region
  application = var.client_name
}

module "eks_cluster_container_cpu_utilization_warning_alert" {
  source              = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Metric-Alarm"
  enabled             = var.eks_cluster_enable_monitoring_global_flag
  tags                = var.default_tags
  metric_namespace    = local.eks_container_insights_metrics_namespace
  metric_name         = local.container_cpu_utilization_metric_name
  alarm_description   = "This alarm monitors container CPU utilization in the cluster and triggers a warning alert"
  alarm_actions       = [module.alert-group.topic_arn]
  comparison_operator = local.cloud_watch_gte_metrics_threshold_string
  threshold           = var.eks_cluster_container_cpu_utilization_warning_threshold
  metric_usage_prefix = join("-", [local.container_cpu_utilization_metric_name_usage, local.warning_alert_usage_suffix])
  dimensions = {
    ClusterName = module.eks_cluster.eks_cluster_name
  }
  statistic   = local.cloud_watch_average_statistic_string
  project     = var.project
  environment = var.environment_name
  region      = var.region
  application = var.client_name
}

module "eks_cluster_container_memory_utilization_warning_alert" {
  source              = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Metric-Alarm"
  enabled             = var.eks_cluster_enable_monitoring_global_flag
  tags                = var.default_tags
  metric_namespace    = local.eks_container_insights_metrics_namespace
  metric_name         = local.container_memory_utilization_metric_name
  alarm_description   = "This alarm monitors container memory utilization in the cluster and triggers a warning alert"
  alarm_actions       = [module.alert-group.topic_arn]
  comparison_operator = local.cloud_watch_gte_metrics_threshold_string
  threshold           = var.eks_cluster_container_memory_utilization_warning_threshold
  metric_usage_prefix = join("-", [local.container_memory_utilization_metric_name_usage, local.warning_alert_usage_suffix])
  dimensions = {
    ClusterName = module.eks_cluster.eks_cluster_name
  }
  statistic   = local.cloud_watch_average_statistic_string
  project     = var.project
  environment = var.environment_name
  region      = var.region
  application = var.client_name
}

module "eks_cluster_container_restarts_warning_alert" {
  source              = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Metric-Alarm"
  enabled             = var.eks_cluster_enable_monitoring_global_flag
  tags                = var.default_tags
  metric_namespace    = local.eks_container_insights_metrics_namespace
  metric_name         = local.container_restarts_metric_name
  alarm_description   = "This alarm monitors container restarts in the cluster and triggers a warning alert"
  alarm_actions       = [module.alert-group.topic_arn]
  comparison_operator = local.cloud_watch_gte_metrics_threshold_string
  threshold           = var.eks_cluster_container_restart_warning_threshold
  metric_usage_prefix = join("-", [local.container_restarts_metric_name_usage, local.warning_alert_usage_suffix])
  dimensions = {
    ClusterName = module.eks_cluster.eks_cluster_name
  }
  statistic   = local.cloud_watch_average_statistic_string
  project     = var.project
  environment = var.environment_name
  region      = var.region
  application = var.client_name
}
