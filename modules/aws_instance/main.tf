# AWS Instance Module
#
# Creates an EC2 instance with configurable settings.

# -----------------------------------------------------------------------------
# Variables
# -----------------------------------------------------------------------------

variable "ami" {
  type        = string
  description = "AMI ID for the EC2 instance"
}

variable "iam_instance_profile" {
  type        = string
  description = "IAM instance profile name to attach to the instance"
  default     = null
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type (e.g., t3.medium)"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where the instance will be launched"
}

variable "private_ip" {
  type        = string
  description = "Private IP address to assign to the instance"
  default     = null
}

variable "key_name" {
  type        = string
  description = "Name of the SSH key pair"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "List of security group IDs to attach"
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Whether to associate a public IP address"
  default     = false
}

variable "ebs_block_device" {
  type = list(object({
    device_name           = string
    volume_size           = number
    volume_type           = optional(string, "gp3")
    delete_on_termination = optional(bool, true)
    encrypted             = optional(bool, true)
  }))
  description = "Additional EBS block devices to attach"
  default     = []
}

variable "user_data" {
  type        = string
  description = "User data script to run on instance launch"
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the instance"
  default     = {}
}

# -----------------------------------------------------------------------------
# Resources
# -----------------------------------------------------------------------------

resource "aws_instance" "this" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  private_ip                  = var.private_ip
  key_name                    = var.key_name
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = var.associate_public_ip_address
  iam_instance_profile        = var.iam_instance_profile
  user_data                   = var.user_data

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 8
    delete_on_termination = true
    encrypted             = true
  }

  dynamic "ebs_block_device" {
    for_each = var.ebs_block_device
    content {
      device_name           = ebs_block_device.value.device_name
      volume_size           = ebs_block_device.value.volume_size
      volume_type           = ebs_block_device.value.volume_type
      delete_on_termination = ebs_block_device.value.delete_on_termination
      encrypted             = ebs_block_device.value.encrypted
    }
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [ami]
  }
}

# -----------------------------------------------------------------------------
# Outputs
# -----------------------------------------------------------------------------

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.this.id
}

output "private_ip" {
  description = "Private IP address of the instance"
  value       = aws_instance.this.private_ip
}

output "public_ip" {
  description = "Public IP address of the instance (if assigned)"
  value       = aws_instance.this.public_ip
}
