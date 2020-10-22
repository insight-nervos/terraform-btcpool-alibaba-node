provider "alicloud" {
  region = var.alicloud_region
}

module "vpc" {
  source   = "git@github.com:insight-nervos/terraform-btcpool-alibaba-network.git"
  vpc_name = var.vpc_name
  num_azs  = 2
}

module "defaults" {
  source            = "../.."
  security_group_id = module.vpc.node_security_group_id
  vpc_id            = module.vpc.vpc_id
  vswitch_id        = module.vpc.public_vswitch_ids[0]
  root_volume_size  = "50"
  create_eip        = true
  public_key        = file(var.public_key_path)
}
