# Terraform Kubernetes Installer

## Purpose
OpenTofu configuration for deploying Kubernetes clusters on AWS (legacy, modernization in progress).

## Stack
- OpenTofu >= 1.6.0 / Terraform (HCL, legacy 0.11 syntax)
- AWS provider (VPC, IAM, ASG, Security Groups)
- Shell scripts for cluster lifecycle

## Structure
- `aws.tf` - main AWS resources
- `modules/` - reusable modules
- `templates/` - cloud-init / user-data templates
- `config/` - Kubernetes configuration
- `init/` - SSH key pairs
- `versions.tf` - provider constraints

## Build & Test
```bash
tofu init
tofu validate
tofu plan
tofu apply
```

## Standards
- OpenTofu preferred
- Google Terraform Style Guide
- Modernization needed: migrate from 0.11 syntax, replace Launch Configurations with Launch Templates
- Conventional Commits: `type(scope): description`

## Known Debt
- Legacy Terraform 0.11 interpolation syntax
- Uses `count` instead of `for_each`
- SSH-based access (should migrate to SSM)
