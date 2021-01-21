#####
# INSTANCE
#####

output "public_ip" {
  value       = var.create_eip ? join("", alicloud_eip.this.*.ip_address) : join("", alicloud_instance.this.*.public_ip)
  description = "The public IP of the instance"
}

output "instance_id" {
  value       = join("", alicloud_instance.this.*.id)
  description = "The Alicloud ID of the instance"
}

output "key_name" {
  value       = var.key_name == "" ? join("", alicloud_key_pair.this.*.key_name) : var.key_name
  description = "The name of the SSH key"
}

#####
# VPC
#####

output "vpc_id" {
  value       = alicloud_vpc.vpc.id
  description = "The ID of the VPC where the instance is deployed"
}

output "private_vswitch_ids" {
  value       = alicloud_vswitch.private.*.id
  description = "The IDs of the Vswitches for the private subnets"
}

output "public_vswitch_ids" {
  value       = alicloud_vswitch.public.*.id
  description = "The IDs of the Vswitches for the public subnets"
}

#####
# SGs
#####
output "bastion_security_group_id" {
  value       = alicloud_security_group.bastion-sg.*.id
  description = "The ID of the Bastion security group"
}

output "node_security_group_id" {
  value       = alicloud_security_group.node-sg.id
  description = "The ID of the instance security group"
}