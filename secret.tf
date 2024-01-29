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

module "secret" {
  source                          = "git::https://github.com/wso2/aws-terraform-modules.git//modules/aws/Secret-Manager-Secret"
  count                           = var.enable_secret ? 1 : 0
  secret_name                     = var.secret_name
  secret_string                   = var.secret_string
  recovery_window_in_days         = var.secret_recovery_window_in_days
  tags                            = var.default_tags
  create_secret_reader_iam_policy = false
}
