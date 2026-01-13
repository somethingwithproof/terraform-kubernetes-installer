################################################################################
# OpenTofu and Provider Version Constraints
# Migrated from Terraform to OpenTofu - January 2026
################################################################################

terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
}
