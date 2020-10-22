variable "create" {
  description = "Boolean to make module or not"
  type        = bool
  default     = true
}

variable "create_eip" {
  description = "Bool to create and attach EIP to instance"
  type        = bool
  default     = false
}

variable "create_ansible" {
  description = "Boolean to make module or not"
  type        = bool
  default     = true
}

########
# Label
########

variable "name" {
  description = "The name of the deployment"
  type        = string
  default     = "polkadot-api"
}

variable "environment" {
  description = "The environment"
  type        = string
  default     = ""
}

variable "namespace" {
  description = "The namespace to deploy into"
  type        = string
  default     = ""
}

variable "stage" {
  description = "The stage of the deployment"
  type        = string
  default     = ""
}

variable "owner" {
  description = "Owner of the infrastructure"
  type        = string
  default     = ""
}

#########
# Network
#########
variable "vpc_id" {
  description = "The ID of the VPC to attach."
  type        = string
}

variable "vswitch_id" {
  description = "The ids of the vswitch to attach."
  type        = string
}

variable "security_group_id" {
  description = "The id of the security group to run in"
  type        = string
}

#####
# Instance
#####
variable "node_name" {
  description = "Name of the node"
  type        = string
  default     = ""
}

variable "root_volume_size" {
  description = "Root volume size"
  type        = string
  default     = 0
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

variable "public_key" {
  description = "The public ssh key. key_name takes precidence"
  type        = string
  default     = ""
}

variable "private_key_path" {
  description = "Path to private key"
  type        = string
  default     = ""
}

variable "key_name" {
  description = "The name of the preexisting key to be used instead of the local public_key_path"
  type        = string
  default     = ""
}

variable "assign_public_ip" {
  description = "Bool to enable assignment of public IP address. Overridden by create_eip."
  type        = bool
  default     = true
}

#########
# Ansible
#########

variable "ssh_user" {
  description = "Username for SSH"
  type        = string
  default     = "ubuntu"
}