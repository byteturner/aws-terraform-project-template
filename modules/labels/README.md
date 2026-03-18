# labels module

Provides consistent naming and tagging conventions for root and child modules.

## Usage

```hcl
module "labels" {
  source = "./modules/labels"

  project_name    = var.project_name
  environment     = var.environment
  owner           = var.owner
  cost_center     = var.cost_center
  additional_tags = var.additional_tags
}

locals {
  name_prefix = module.labels.name_prefix
  common_tags = module.labels.tags
}
```

## Terraform module reference

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | Additional tags merged into the baseline tag map. | `map(string)` | `{}` | no |
| <a name="input_cost_center"></a> [cost\_center](#input\_cost\_center) | Cost allocation reference for tagging. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment label used in names and tags. | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | Owner or team responsible for resources. | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project identifier used as the base for normalized naming and tags. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name_prefix"></a> [name\_prefix](#output\_name\_prefix) | Normalized prefix composed of project and environment. |
| <a name="output_normalized_project_name"></a> [normalized\_project\_name](#output\_normalized\_project\_name) | Normalized project name used by the module. |
| <a name="output_tags"></a> [tags](#output\_tags) | Baseline tag map merged with additional\_tags. |
<!-- END_TF_DOCS -->
