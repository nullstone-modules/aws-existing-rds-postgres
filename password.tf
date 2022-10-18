resource "aws_secretsmanager_secret" "master" {
  name = "${local.resource_name}/master"
  tags = local.tags
}

resource "aws_secretsmanager_secret_version" "master" {
  secret_id     = aws_secretsmanager_secret.master.id
  secret_string = jsonencode(tomap({ "username" = var.db_admin_username, "password" = var.db_admin_password }))
}
