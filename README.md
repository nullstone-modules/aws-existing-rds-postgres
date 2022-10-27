# Existing RDS Postgres

This module allows you to register an existing AWS RDS Postgres Instance in Nullstone.
This allows users to connect applications to RDS Postgres in Nullstone without having an existing Terraform and state file.

## When should I use this module?

You are creating an application in Nullstone that needs to connect to an AWS RDS Postgres Instance that was not created in Nullstone.

## What does it do?

- Creates an administrative lambda function that is used to gatekeep access to the AWS RDS Postgres Instance.
- Exposes the same outputs as a normal postgres datastore.

## How to use

1. Create a datastore for existing RDS Postgres.
2. Find your existing RDS instance in the AWS console. Copy the database identifier.
3. Launch the datastore.
   1. Use the database identifier for the `db_identifier` variable.
   2. Input the credentials for the admin user in `db_admin_username` and `db_admin_password` variables.
4. Connect your application to the RDS datastore as a capability.
