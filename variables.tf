variable "db_identifier" {
  type        = string
  description = "The identifier of the DB used to import information about the RDS instance."
}

variable "db_admin_username" {
  type        = string
  description = "The username of a postgres user that has admin access to the instance."
}

variable "db_admin_password" {
  type        = string
  description = "The password of a postgres user that has admin access to the instance."
  sensitive   = true
}
