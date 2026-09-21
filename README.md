# terraform-app

This repository owns the application workload and its separate Terraform
state. The VPC, subnet, SSM instance profile, OIDC provider, and IAM roles are
created by `terraform-core`; their stable IDs are passed here as variables.

The backend uses the shared private state bucket with the independent key
`terraform-app/terraform.tfstate`. GitHub Actions authenticates through the
`dev-terraform-app-role` OIDC role.

The default values in `variables.tf` match the current lab foundation. Override
them with `-var` or a local, ignored `.tfvars` file when the foundation is
recreated.
