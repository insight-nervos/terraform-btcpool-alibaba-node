variable "create" {
  description = "Boolean to make module or not"
  type        = bool
  default     = true
}

variable "create_eip" {
  description = "Bool to create and attach EIP to instance"
  type        = bool
  default     = true
}

########
# Label
########
variable "name" {
  description = "The name for the label"
  type        = string
  default     = "btcpool"
}

variable "suffix" {
  description = "Suffix to attach to name"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Map of tags"
  type        = map(string)
  default     = {}
}

##################
# Security Groups
##################
variable "all_enabled" {
  description = "Bool to enable all the security groups"
  type        = bool
  default     = false
}

variable "corporate_ip" {
  description = "The corporate IP you want to restrict ssh traffic to"
  type        = string
  default     = ""
}

variable "bastion_enabled" {
  description = "Boolean to enable a bastion host.  All ssh traffic restricted to bastion"
  type        = bool
  default     = false
}

variable "bastion_sg_name" {
  description = "Name for the bastion security group"
  type        = string
  default     = "bastion-sg"
}

variable "node_sg_name" {
  description = "Name for the node security group"
  type        = string
  default     = "node-sg"
}