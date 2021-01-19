data "alicloud_regions" "current" {
  current = true
}

data "alicloud_zones" "az" {
  network_type = "Vpc"
}

data "alicloud_images" "this" {
  most_recent = true
  name_regex  = "^ubuntu_18.*64"
}

data "alicloud_instance_types" "this" {
  availability_zone    = alicloud_vswitch.public[0].availability_zone
  cpu_core_count       = var.instance_cpu_cores
  memory_size          = var.instance_memory
  instance_type_family = var.instance_family
}

