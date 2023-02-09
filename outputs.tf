output "db_instance_arn" {
  value       = data.aws_db_instance.this.db_instance_arn
  description = "string ||| ARN of the Postgres instance"
}

output "db_instance_id" {
  value       = data.aws_db_instance.this.id
  description = "string ||| ID of the Postgres instance"
}

output "db_master_secret_name" {
  value       = aws_secretsmanager_secret.master.name
  description = "string ||| The name of the secret in AWS Secrets Manager containing the password"
}

output "db_endpoint" {
  value       = data.aws_db_instance.this.endpoint
  description = "string ||| The endpoint URL to access the Postgres instance."
}

output "db_security_group_id" {
  value       = local.db_security_group_id
  description = "string ||| The ID of the security group attached to the Postgres instance."
}

output "db_admin_function_name" {
  value       = module.db_admin.function_name
  description = "string ||| AWS Lambda Function name for database admin utility"
}

output "db_admin_function_url" {
  value       = module.db_admin.function_url
  description = "string ||| AWS Lambda Function url for database admin utility"
}

output "db_admin_invoker" {
  value       = module.db_admin.invoker
  description = "object({ name: string, access_key: string, secret_key: string }) ||| IAM User with explicit permissions to invoke db admin lambda function."
  sensitive   = true
}

output "db_log_group" {
  value       = local.cloudwatch_log_group_pg
  description = "string ||| The name of the Cloudwatch Log Group where postgresql logs are emitted for the DB Instance"
}

output "db_upgrade_log_group" {
  value       = local.cloudwatch_log_group_upgrade
  description = "string ||| The name of the Cloudwatch Log Group where upgrade logs are emitted for the DB Instance"
}
