variable "node_name" {
  description = "Name of the node"
  type        = string
  default     = ""
}

variable "root_volume_size" {
  description = "Root volume size"
  type        = string
  default     = "20"
}

variable "instance_family" {
  description = "Instance family"
  type        = string
  default     = "ecs.g6"
}

variable "instance_cpu_cores" {
  description = "Instance CPU cores"
  type        = string
  default     = "2"
}

variable "instance_memory" {
  description = "Instance memory (in GB)"
  type        = string
  default     = "8"
}

variable "key_name" {
  description = "The key pair to import - leave blank to generate new keypair from pub/priv ssh key path"
  type        = string
  default     = ""
}

variable "public_key_path" {
  description = "The path to the public ssh key"
  type        = string
  default     = ""
}

variable "private_key_path" {
  description = "Path to private key"
  type        = string
  default     = ""
}

variable "assign_public_ip" {
  description = "Bool to enable assignment of public IP address. Overridden by create_eip."
  type        = bool
  default     = true
}

###

resource "alicloud_key_pair" "this" {
  count      = var.public_key_path != "" && var.create ? 1 : 0
  public_key = file(pathexpand(var.public_key_path))
  tags       = merge({ Name = local.name_suffix }, var.tags)
}

resource "alicloud_eip" "this" {
  count = var.create && var.create_eip ? 1 : 0
  tags  = merge({ Name = local.name_suffix }, var.tags)
}

resource "alicloud_eip_association" "this" {
  count         = var.create && var.create_eip ? 1 : 0
  allocation_id = alicloud_eip.this.0.id
  instance_id   = alicloud_instance.this.0.id
}

resource "alicloud_instance" "this" {
  count             = var.create ? 1 : 0
  instance_name     = var.node_name != "" ? var.node_name : null
  availability_zone = alicloud_vswitch.public[0].availability_zone

  image_id        = data.alicloud_images.this.images[0].id
  instance_type   = data.alicloud_instance_types.this.instance_types[0].id
  security_groups = [alicloud_security_group.node-sg.id]

  vswitch_id                 = alicloud_vswitch.public[0].id
  internet_max_bandwidth_out = ! var.create_eip && var.assign_public_ip ? 100 : 0

  system_disk_size = var.root_volume_size

  user_data = templatefile("${path.module}/userdata.sh.tpl", { ssh_key = chomp(file(pathexpand(var.public_key_path))) })
  key_name  = var.public_key_path == "" ? var.key_name : alicloud_key_pair.this.*.key_name[0]

  tags = merge({ Name = local.name_suffix }, var.tags)
}