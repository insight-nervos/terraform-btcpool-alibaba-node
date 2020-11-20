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