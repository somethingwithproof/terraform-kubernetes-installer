# AWS Subnet Module
#
# Creates a subnet within a VPC.

# -----------------------------------------------------------------------------
# Variables
# -----------------------------------------------------------------------------

variable "cidr_block" {
  type        = string
  description = "CIDR block for the subnet"

  validation {
    condition     = can(cidrhost(var.cidr_block, 0))
    error_message = "Must be a valid CIDR block."
  }
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC where the subnet will be created"
}

variable "availability_zone" {
  type        = string
  description = "Availability zone for the subnet"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Assign public IP to instances launched in this subnet"
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the subnet"
  default     = {}
}

# -----------------------------------------------------------------------------
# Resources
# -----------------------------------------------------------------------------

resource "aws_subnet" "this" {
  cidr_block              = var.cidr_block
  vpc_id                  = var.vpc_id
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = merge(
    var.tags,
    {
      Name = lookup(var.tags, "Name", "subnet-${var.availability_zone}")
    }
  )
}

# -----------------------------------------------------------------------------
# Outputs
# -----------------------------------------------------------------------------

output "subnet_id" {
  description = "ID of the subnet"
  value       = aws_subnet.this.id
}

output "subnet_arn" {
  description = "ARN of the subnet"
  value       = aws_subnet.this.arn
}

output "availability_zone" {
  description = "Availability zone of the subnet"
  value       = aws_subnet.this.availability_zone
}
