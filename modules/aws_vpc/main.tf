# AWS VPC Module
#
# Creates a VPC with DNS support enabled.

# -----------------------------------------------------------------------------
# Variables
# -----------------------------------------------------------------------------

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC (e.g., 10.0.0.0/16)"

  validation {
    condition     = can(cidrhost(var.cidr_block, 0))
    error_message = "Must be a valid CIDR block."
  }
}

variable "enable_dns_support" {
  type        = bool
  description = "Enable DNS support in the VPC"
  default     = true
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in the VPC"
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the VPC"
  default     = {}
}

# -----------------------------------------------------------------------------
# Resources
# -----------------------------------------------------------------------------

resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = merge(
    var.tags,
    {
      Name = lookup(var.tags, "Name", "vpc-${var.cidr_block}")
    }
  )
}

# -----------------------------------------------------------------------------
# Outputs
# -----------------------------------------------------------------------------

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.this.id
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.this.cidr_block
}

output "default_security_group_id" {
  description = "ID of the default security group"
  value       = aws_vpc.this.default_security_group_id
}
