variable "cidr_block" {}
variable "tags" { type = map(string) }

resource "aws_vpc" "aws_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = var.tags
}
