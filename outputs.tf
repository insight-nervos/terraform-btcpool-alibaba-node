output "public_ip" {
  value = var.create_eip ? join("", alicloud_eip.this.*.ip_address) : join("", alicloud_instance.this.*.public_ip)
}

output "instance_id" {
  value = join("", alicloud_instance.this.*.id)
}

output "key_name" {
  value = var.key_name == "" ? join("", alicloud_key_pair.this.*.key_name) : var.key_name
}