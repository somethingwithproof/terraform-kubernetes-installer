# CLAUDE.md

Legacy Kubernetes cluster deployment on AWS using Terraform 0.11 syntax (modernization in progress).

## Stack
- Terraform >= 1.0.0
- AWS Provider ~> 5.0
- Legacy syntax requires migration to Terraform 1.x

## Usage

```bash
terraform init
terraform validate
terraform plan
```

## Important Notes
- Default branch is `master` not `main`
- Uses Launch Configurations (planned migration to Launch Templates)
- VPC with public subnets, IAM roles, security groups, and ASGs
- SSH key pair generation required in init/ directory before deployment
