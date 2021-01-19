#####
# INSTANCE
#####

output "public_ip" {
  value = var.create_eip ? join("", alicloud_eip.this.*.ip_address) : join("", alicloud_instance.this.*.public_ip)
}

output "instance_id" {
  value = join("", alicloud_instance.this.*.id)
}

output "key_name" {
  value = var.key_name == "" ? join("", alicloud_key_pair.this.*.key_name) : var.key_name
}

#####
# VPC
#####

output "vpc_id" {
  value = alicloud_vpc.vpc.id
}

output "private_vswitch_ids" {
  value = alicloud_vswitch.private.*.id
}

output "public_vswitch_ids" {
  value = alicloud_vswitch.public.*.id
}

#####
# SGs
#####
output "bastion_security_group_id" {
  value = alicloud_security_group.bastion-sg.*.id
}

output "node_security_group_id" {
  value = alicloud_security_group.node-sg.id
}