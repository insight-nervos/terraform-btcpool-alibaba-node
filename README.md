# terraform-btcpool-alibaba-node

[![open-issues](https://img.shields.io/github/issues-raw/insight-nervos/terraform-btcpool-alibaba-node?style=for-the-badge)](https://github.com/insight-nervos/terraform-btcpool-alibaba-node/issues)
[![open-pr](https://img.shields.io/github/issues-pr-raw/insight-nervos/terraform-btcpool-alibaba-node?style=for-the-badge)](https://github.com/insight-nervos/terraform-btcpool-alibaba-node/pulls)

## Features

This module...

## Terraform Versions

For Terraform v0.12.0+

## Usage

```hcl
module "this" {
  source = "github.com/insight-nervos/terraform-btcpool-alibaba-node"
}
```
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
| assign\_public\_ip | Bool to enable assignment of public IP address. Overridden by create\_eip. | `bool` | `true` | no |
| bastion\_ip | Optional IP for bastion - blank for no bastion | `string` | `""` | no |
| bastion\_user | Optional bastion user - blank for no bastion | `string` | `""` | no |
| btcpool\_env\_file\_path | Path to .env file for deployment | `string` | `""` | no |
| create | Boolean to make module or not | `bool` | `true` | no |
| create\_dns | Bool to create ssl cert and nginx proxy | `bool` | `true` | no |
| create\_eip | Bool to create and attach EIP to instance | `bool` | `true` | no |
| domain\_name | The domain - example.com. Blank for no ssl / nginx | `string` | `""` | no |
| enable\_btcpool\_ssl | Bool to enable SSL | `bool` | `false` | no |
| hostname | The hostname - ie hostname.example.com - blank for example.com | `string` | `""` | no |
| instance\_cpu\_cores | Instance CPU cores | `string` | `"2"` | no |
| instance\_family | Instance family | `string` | `"ecs.g6"` | no |
| instance\_memory | Instance memory (in GB) | `string` | `"8"` | no |
| key\_name | The key pair to import - leave blank to generate new keypair from pub/priv ssh key path | `string` | `""` | no |
| name | The name for the label | `string` | `"btcpool"` | no |
| node\_name | Name of the node | `string` | `""` | no |
| playbook\_vars | Additional playbook vars | `map(string)` | `{}` | no |
| private\_key\_path | Path to private key | `string` | `""` | no |
| public\_key\_path | The path to the public ssh key | `string` | `""` | no |
| root\_volume\_size | Root volume size | `string` | `"20"` | no |
| security\_group\_id | The id of the security group to run in | `string` | n/a | yes |
| suffix | Suffix to attach to name | `string` | `""` | no |
| tags | Map of tags | `map(string)` | `{}` | no |
| vpc\_id | The ID of the VPC to attach. | `string` | n/a | yes |
| vswitch\_id | The ids of the vswitch to attach. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| instance\_id | n/a |
| key\_name | n/a |
| public\_ip | n/a |

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