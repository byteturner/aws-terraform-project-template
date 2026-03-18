# cloudwatch-log-group module

Creates a CloudWatch log group with configurable retention and optional KMS encryption.

## Baseline behavior

- Creates one CloudWatch log group
- Uses a default retention period of 30 days
- Supports optional KMS key configuration
- Applies caller-provided tags

## Usage

```hcl
module "labels" {
  source = "../labels"

  project_name = var.project_name
  environment  = var.environment
  owner        = var.owner
  cost_center  = var.cost_center
}

module "app_logs" {
  source = "../cloudwatch-log-group"

  name              = "/aws/${module.labels.name_prefix}/application"
  retention_in_days = 90
  tags              = module.labels.tags
}
```

## Terraform module reference

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.31 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.36.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | Optional KMS key ID or ARN used to encrypt log data. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the CloudWatch log group to create. | `string` | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | Number of days to retain log events. | `number` | `30` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags applied to all resources managed by this module. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the CloudWatch log group. |
| <a name="output_id"></a> [id](#output\_id) | ID of the CloudWatch log group. |
| <a name="output_name"></a> [name](#output\_name) | Name of the CloudWatch log group. |
<!-- END_TF_DOCS -->
