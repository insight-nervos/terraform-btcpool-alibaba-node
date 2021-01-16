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

variable "stack_type" {
  description = "The type of stack to deploy - "
  default     = "prometheus"
  type        = string
}

module "ansible" {
  source           = "github.com/insight-infrastructure/terraform-ansible-playbook.git?ref=v0.15.0"
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
    stack_type    = var.stack_type
    env_file_path = var.btcpool_env_file_path
  }, var.playbook_vars)
}