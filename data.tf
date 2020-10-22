data "alicloud_vpcs" "this" {
  ids = [var.vpc_id]
}

data "alicloud_vswitches" "this" {
  ids = [var.vswitch_id]
}

data "alicloud_images" "this" {
  most_recent = true
  name_regex  = "^ubuntu_18.*64"
}

data "alicloud_instance_types" "this" {
  availability_zone    = data.alicloud_vswitches.this.vswitches.0.zone_id
  cpu_core_count       = var.instance_cpu_cores
  memory_size          = var.instance_memory
  instance_type_family = var.instance_family
}

