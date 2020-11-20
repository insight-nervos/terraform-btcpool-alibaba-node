#########
# Ansible
#########
variable "playbook_vars" {
  description = "Additional playbook vars"
  type        = map(string)
  default     = {}
}

variable "bastion_user" {
  description = "Optional bastion user - blank for no bastion"
  type        = string
  default     = ""
}

variable "bastion_ip" {
  description = "Optional IP for bastion - blank for no bastion"
  type        = string
  default     = ""
}

variable "enable_btcpool_ssl" {
  description = "Bool to enable SSL"
  type        = bool
  default     = false
}

variable "btcpool_env_file_path" {
  description = "Path to .env file for deployment"
  type        = string
  default     = ""
}

module "ansible" {
  source           = "git@github.com:insight-infrastructure/terraform-ansible-playbook.git"
  create           = var.create
  ip               = var.create_eip ? join("", alicloud_eip.this.*.ip_address) : join("", alicloud_instance.this.*.public_ip)
  user             = "root"
  private_key_path = var.private_key_path

  bastion_ip   = var.bastion_ip
  bastion_user = var.bastion_user

  playbook_file_path     = "${path.module}/ansible/main.yml"
  requirements_file_path = "${path.module}/ansible/requirements.yml"
  forks                  = 1

  playbook_vars = merge({
    enable_btcpool_ssl = var.domain_name != "" ? false : var.enable_btcpool_ssl
    env_file_path      = var.btcpool_env_file_path
  }, var.playbook_vars)
}