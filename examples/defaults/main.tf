variable "alicloud_region" {
  default = "us-east-1"
}

variable "name" {
  default = "example"
}

variable "private_key_path" {}
variable "public_key_path" {}

provider "alicloud" {
  region = var.alicloud_region
}

module "defaults" {
  source           = "../.."
  name             = var.name
  num_azs          = 2
  public_key_path  = var.public_key_path
  private_key_path = var.private_key_path
}

output "public_ip" {
  value = module.defaults.public_ip
}