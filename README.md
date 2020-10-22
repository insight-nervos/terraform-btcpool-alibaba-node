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
| create | Boolean to make module or not | `bool` | `true` | no |
| create\_ansible | Boolean to make module or not | `bool` | `true` | no |
| create\_eip | Bool to create and attach EIP to instance | `bool` | `false` | no |
| environment | The environment | `string` | `""` | no |
| instance\_cpu\_cores | Instance CPU cores | `string` | `"2"` | no |
| instance\_family | Instance family | `string` | `"ecs.g6"` | no |
| instance\_memory | Instance memory (in GB) | `string` | `"8"` | no |
| key\_name | The name of the preexisting key to be used instead of the local public\_key\_path | `string` | `""` | no |
| name | The name of the deployment | `string` | `"polkadot-api"` | no |
| namespace | The namespace to deploy into | `string` | `""` | no |
| node\_name | Name of the node | `string` | `""` | no |
| owner | Owner of the infrastructure | `string` | `""` | no |
| private\_key\_path | Path to private key | `string` | `""` | no |
| public\_key | The public ssh key. key\_name takes precidence | `string` | `""` | no |
| root\_volume\_size | Root volume size | `string` | `0` | no |
| security\_group\_id | The id of the security group to run in | `string` | n/a | yes |
| ssh\_user | Username for SSH | `string` | `"ubuntu"` | no |
| stage | The stage of the deployment | `string` | `""` | no |
| vpc\_id | The ID of the VPC to attach. | `string` | n/a | yes |
| vswitch\_id | The ids of the vswitch to attach. | `string` | n/a | yes |

## Outputs

No output.

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