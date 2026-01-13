# Terraform Kubernetes Installer

OpenTofu configuration for deploying Kubernetes clusters on AWS.

[![OpenTofu CI](https://github.com/thomasvincent/terraform-kubernetes-installer/actions/workflows/terraform-ci.yml/badge.svg)](https://github.com/thomasvincent/terraform-kubernetes-installer/actions/workflows/terraform-ci.yml)
[![OpenTofu](https://img.shields.io/badge/OpenTofu-%3E%3D1.6.0-blue)](https://opentofu.org/)

> **Note**: This module has been migrated from Terraform to [OpenTofu](https://opentofu.org/), the open-source fork of Terraform. OpenTofu is a drop-in replacement and is fully compatible with existing Terraform configurations.

## Status

**Note:** This repository contains legacy Terraform code (Terraform 0.11 syntax). A modernization effort is in progress.

## Recent Updates

- Added CI/CD pipeline with Terraform validation, TFLint, and tfsec
- Added `versions.tf` with provider version constraints
- Removed committed state files from VCS
- Added `.gitignore` for Terraform artifacts

## Architecture

This configuration deploys:

- VPC with public subnets
- IAM roles and instance profiles for masters and minions
- Security groups for cluster communication
- Auto Scaling Groups for masters and minions
- SSH key pair for node access

## Prerequisites

- OpenTofu >= 1.6.0 (or Terraform >= 1.0.0)
- AWS CLI configured with appropriate credentials
- SSH key pair generated in `init/` directory

## Usage

1. Configure your variables in a `terraform.tfvars` file
2. Initialize OpenTofu: `tofu init`
3. Plan the deployment: `tofu plan`
4. Apply: `tofu apply`

## Remote State (Recommended)

Configure a remote backend for state management:

```hcl
terraform {
  backend "s3" {
    bucket         = "my-terraform-state"
    key            = "kubernetes/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}
```

## Modernization Roadmap

The following improvements are planned:

- [ ] Migrate to Terraform 1.x syntax (remove `"${var.x}"` interpolation)
- [ ] Add type constraints to all variables
- [ ] Add input validation blocks
- [ ] Replace Launch Configurations with Launch Templates
- [ ] Use `for_each` instead of `count` where appropriate
- [ ] Replace SSH with SSM Session Manager
- [ ] Implement stricter security group rules
- [ ] Add examples directory
- [ ] Add comprehensive tests

## Contributing

Contributions are welcome! Please read the contributing guidelines first.

## License

MIT License - see LICENSE for details.
