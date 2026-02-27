variable "cluster_name" {}
variable "zone" {}
variable "provider" {}
variable "vpc_name" {}
variable "subnet_cidr" {}
variable "master_cidr" {}
variable "region" {}
variable "master_host_number" {}
variable "images" { type = map(string) }
variable "size" { type = map(string) }
variable "vpc" { type = map(string) }
variable "iam_role" { type = map(string) }
variable "iam_role_policy" { type = map(string) }
variable "subnet" { type = map(string) }
variable "security_group_ingress" { type = map(string) }
variable "security_group_egress" { type = map(string) }
variable "ssh_key" { type = map(string) }
variable "ssh_user" {}
variable "associate_public_ip_address" {}
variable "spot_price" {}
variable "number_of_minions" { type = map(string) }
variable "number_of_masters" { type = map(string) }
variable "startup_volume" { type = map(string) }
variable "master_ip_range" {}
