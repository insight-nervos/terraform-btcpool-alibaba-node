variable "create_dns" {
  description = "Bool to create ssl cert and nginx proxy"
  type        = bool
  default     = true
}

variable "domain_name" {
  description = "The domain - example.com. Blank for no ssl / nginx"
  type        = string
  default     = ""
}

variable "hostname" {
  description = "The hostname - ie hostname.example.com - blank for example.com"
  type        = string
  default     = ""
}

data "alicloud_dns_domains" "this" {
  count             = var.domain_name != "" && var.create_dns ? 1 : 0
  domain_name_regex = var.domain_name
}

resource "alicloud_alidns_record" "this" {
  count       = var.domain_name != "" && var.hostname != "" && var.create_dns ? 1 : 0
  domain_name = data.alicloud_dns_domains.this[0].domains[0].domain_id
  rr          = var.hostname == "" ? "@" : var.hostname
  type        = "A"
  value       = var.create_eip ? join("", alicloud_eip.this.*.ip_address) : join("", alicloud_instance.this.*.public_ip)
  status      = "ENABLE"
}