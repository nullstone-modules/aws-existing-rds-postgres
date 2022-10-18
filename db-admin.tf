module "db_admin" {
  source  = "api.nullstone.io/nullstone/aws-pg-db-admin/aws"
  version = "~> 0.5.0"

  name     = local.resource_name
  tags     = local.tags
  host     = data.aws_db_instance.this.address
  username = var.db_admin_username
  password = var.db_admin_password

  network = {
    vpc_id               = local.vpc_id
    pg_security_group_id = local.db_security_group_id
    security_group_ids   = []
    subnet_ids           = local.private_subnet_ids
  }
}
