# terraform-btcpool-alibaba-node

[![open-issues](https://img.shields.io/github/issues-raw/insight-nervos/terraform-btcpool-alibaba-node?style=for-the-badge)](https://github.com/insight-nervos/terraform-btcpool-alibaba-node/issues)
[![open-pr](https://img.shields.io/github/issues-pr-raw/insight-nervos/terraform-btcpool-alibaba-node?style=for-the-badge)](https://github.com/insight-nervos/terraform-btcpool-alibaba-node/pulls)

## Features

This module sets up a Nervos mining pool on Alibaba Cloud with terraform. It uses an [Ansible role](https://github.com/insight-stratum/ansible-role-btcpool) 
to configure a node with docker and run a [btcpool docker-compose](https://github.com/insight-stratum/btcpool-docker-compose) 
setup. 

For AWS, check github organization. 

#### Dependencies 

- [Terraform v0.12.0+](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- [Ansible - v2.9+](https://github.com/ansible/ansible) - `pip install ansible`
- Python
- Submodules (nothing to install)
    - [ansible-role-btcpool](https://github.com/insight-stratum/ansible-role-btcpool)
    - [btcpool-docker-compose](https://github.com/insight-stratum/btcpool-docker-compose)

## Usage

[Install terraform v0.13+](https://learn.hashicorp.com/tutorials/terraform/install-cli), [get Alibaba credentials](https://partners-intl.aliyun.com/help/doc-detail/91289.htm), clone this repository and cd into it. 

```shell script
# Create ssh keys and take note of path 
ssh-keygen -b 4096 
# Modify the terraform.tfvars and remove comments ('//')
nano terraform.tfvars 
terraform init 
terraform apply 
```

### Example module 

```hcl
provider "alicloud" {
  region = var.alicloud_region
}

module "defaults" {
  source = "github.com/insight-nervos/terraform-btcpool-alibaba-node"
  vpc_name = var.vpc_name
  num_azs = 2
  root_volume_size  = "50"
  create_eip        = true
  public_key        = file(var.public_key_path)
}
```

For more advanced configurations, 

## Examples

- [defaults](https://github.com/insight-nervos/terraform-btcpool-alibaba-node/tree/master/examples/defaults)

## Known  Issues
No issue is creating limit on this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| alicloud | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| all\_enabled | Bool to enable all the security groups | `bool` | `false` | no |
| assign\_public\_ip | Bool to enable assignment of public IP address. Overridden by create\_eip. | `bool` | `true` | no |
| azs | List of availability zones | `list(string)` | `[]` | no |
| bastion\_enabled | Boolean to enable a bastion host.  All ssh traffic restricted to bastion | `bool` | `false` | no |
| bastion\_ip | Optional IP for bastion - blank for no bastion | `string` | `""` | no |
| bastion\_sg\_name | Name for the bastion security group | `string` | `"bastion-sg"` | no |
| bastion\_user | Optional bastion user - blank for no bastion | `string` | `""` | no |
| btcpool\_env\_file\_path | Path to .env file for deployment | `string` | `""` | no |
| cidr | The cidr range for network | `string` | `"10.0.0.0/16"` | no |
| corporate\_ip | The corporate IP you want to restrict ssh traffic to | `string` | `""` | no |
| create | Boolean to make module or not | `bool` | `true` | no |
| create\_dns | Bool to create ssl cert and nginx proxy | `bool` | `true` | no |
| create\_eip | Bool to create and attach EIP to instance | `bool` | `true` | no |
| create\_private\_subnets | Bool to enable creation of private subnets | `bool` | `false` | no |
| domain\_name | The domain - example.com. Blank for no ssl / nginx | `string` | `""` | no |
| enable\_btcpool\_ssl | Bool to enable SSL | `bool` | `false` | no |
| hostname | The hostname - ie hostname.example.com - blank for example.com | `string` | `""` | no |
| instance\_cpu\_cores | Instance CPU cores | `string` | `"2"` | no |
| instance\_family | Instance family | `string` | `"ecs.g6"` | no |
| instance\_memory | Instance memory (in GB) | `string` | `"8"` | no |
| key\_name | The key pair to import - leave blank to generate new keypair from pub/priv ssh key path | `string` | `""` | no |
| name | The name for the label | `string` | `"btcpool"` | no |
| node\_name | Name of the node | `string` | `""` | no |
| node\_sg\_name | Name for the node security group | `string` | `"node-sg"` | no |
| num\_azs | The number of AZs to deploy into | `number` | `0` | no |
| playbook\_vars | Additional playbook vars | `map(string)` | `{}` | no |
| private\_key\_path | Path to private key | `string` | `""` | no |
| public\_key\_path | The path to the public ssh key | `string` | `""` | no |
| public\_ports | List of publicly open ports | `list(number)` | <pre>[<br>  1800,<br>  8114,<br>  8115,<br>  9021,<br>  9090,<br>  3000<br>]</pre> | no |
| root\_volume\_size | Root volume size | `string` | `"20"` | no |
| stack\_type | The type of stack to deploy - | `string` | `"prometheus"` | no |
| suffix | Suffix to attach to name | `string` | `""` | no |
| tags | Map of tags | `map(string)` | `{}` | no |
| vpc\_name | The name of the VPC | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| bastion\_security\_group\_id | #### SGs #### |
| instance\_id | n/a |
| key\_name | n/a |
| node\_security\_group\_id | n/a |
| private\_vswitch\_ids | n/a |
| public\_ip | n/a |
| public\_vswitch\_ids | n/a |
| vpc\_id | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Testing
This module has been packaged with terratest tests

To run them:

1. Install Go
2. Run `make test-init` from the root of this repo
3. Run `make test` again from root

## Authors

Module managed by [Richard Mah](https://github.com/shinyfoil)

## Credits

- [Anton Babenko](https://github.com/antonbabenko)

## License

Apache 2 Licensed. See LICENSE for full details.