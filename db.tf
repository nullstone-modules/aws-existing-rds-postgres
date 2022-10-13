data "aws_db_instance" "this" {
  db_instance_identifier = var.db_identifier
}

locals {
  db_security_group_id         = data.aws_db_instance.this.vpc_security_groups[0]
  enabled_logs                 = data.aws_db_instance.this.enabled_cloudwatch_logs_exports
  cloudwatch_log_group_pg      = contains(local.enabled_logs, "postgresql") ? "/aws/rds/instance/${var.db_identifier}/postgresql" : ""
  cloudwatch_log_group_upgrade = contains(local.enabled_logs, "upgrade") ? "/aws/rds/instance/${var.db_identifier}/upgrade" : ""
}
