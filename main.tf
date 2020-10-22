resource "alicloud_key_pair" "this" {
  count      = var.key_name == "" && var.create ? 1 : 0
  public_key = var.public_key
}

resource "alicloud_eip" "this" {
  count = var.create_eip ? 1 : 0
}

resource "alicloud_eip_association" "this" {
  count         = var.create_eip ? 1 : 0
  allocation_id = alicloud_eip.this.0.id
  instance_id   = alicloud_instance.this.0.id
}

resource "alicloud_instance" "this" {
  count             = var.create ? 1 : 0
  instance_name     = var.node_name != "" ? var.node_name : null
  availability_zone = data.alicloud_vswitches.this.vswitches.0.zone_id

  image_id        = data.alicloud_images.this.images[0].id
  instance_type   = data.alicloud_instance_types.this.instance_types[0].id
  security_groups = [var.security_group_id]

  vswitch_id                 = var.vswitch_id
  internet_max_bandwidth_out = ! var.create_eip && var.assign_public_ip ? 100 : 0

  system_disk_size = var.root_volume_size

  key_name = var.key_name != "" ? alicloud_key_pair.this.0.key_name : null
}