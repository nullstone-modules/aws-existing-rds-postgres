locals {
  db_admin_subnet_ids = coalescelist(local.private_subnet_ids, local.public_subnet_ids)
}

module "db_admin" {
  source  = "api.nullstone.io/nullstone/aws-pg-db-admin/aws"
  version = "~> 0.6.0"

  name     = local.resource_name
  tags     = local.tags
  host     = data.aws_db_instance.this.address
  username = var.db_admin_username
  password = var.db_admin_password

  network = {
    vpc_id               = local.vpc_id
    pg_security_group_id = local.db_security_group_id
    security_group_ids   = []
    subnet_ids           = local.db_admin_subnet_ids
  }
}
