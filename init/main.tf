variable "ssh_key" { type = map(string) }
module "key_setup" {
  source   = "./../modules/util_key_setup"
  key_file = var.ssh_key["key_file"]
}
