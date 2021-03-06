variable "azs" {
  description = "List of availability zones"
  type        = list(string)
  default     = []
}

variable "num_azs" {
  description = "The number of AZs to deploy into"
  type        = number
  default     = 1
}

variable "cidr" {
  description = "The cidr range for network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "create_private_subnets" {
  description = "Bool to enable creation of private subnets"
  type        = bool
  default     = false
}

locals {
  //    Logic for AZs is azs variable > az_num variable > max azs for region
  az_num = chunklist(data.alicloud_zones.az.ids, var.num_azs)[0]
  az_max = data.alicloud_zones.az.ids
  azs    = coalescelist(var.azs, local.az_num, local.az_max)

  num_azs = length(local.azs)
  //  TODO: If making additional subnets, this will change
  subnet_num   = 2
  subnet_count = local.subnet_num * local.num_azs

  subnet_bits = ceil(log(local.subnet_count, 2))

  public_subnets = [for subnet_num in range(local.num_azs) : cidrsubnet(
    var.cidr,
    local.subnet_bits,
  subnet_num)]

  private_subnets = [for subnet_num in range(local.num_azs) : cidrsubnet(
    var.cidr,
    local.subnet_bits,
    local.num_azs + subnet_num,
  )]
}

resource "alicloud_vpc" "vpc" {
  name       = local.name_camel_case
  cidr_block = var.cidr
}

resource "alicloud_vswitch" "public" {
  count             = length(local.public_subnets)
  vpc_id            = alicloud_vpc.vpc.id
  cidr_block        = local.public_subnets[count.index]
  availability_zone = element(local.azs, count.index)
  name              = "public-${count.index}"
}

resource "alicloud_vswitch" "private" {
  count             = var.create_private_subnets ? length(local.private_subnets) : 0
  vpc_id            = alicloud_vpc.vpc.id
  cidr_block        = local.private_subnets[count.index]
  availability_zone = element(local.azs, count.index)
  name              = "private-${count.index}"
}