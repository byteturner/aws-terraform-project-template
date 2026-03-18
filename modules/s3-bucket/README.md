# s3-bucket module

Creates an S3 bucket with a secure default baseline.

## Baseline behavior

- Creates an S3 bucket
- Enables versioning by default
- Configures default encryption (`AES256` or `aws:kms`)
- Applies bucket-level public access block settings
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

module "artifact_bucket" {
  source = "../s3-bucket"

  bucket_name = "${module.labels.name_prefix}-artifacts"
  tags        = module.labels.tags
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
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Name of the S3 bucket to create. | `string` | n/a | yes |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | When true, allows Terraform to delete the bucket even if it contains objects. | `bool` | `false` | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | Optional KMS key ARN to use when sse\_algorithm is set to aws:kms. | `string` | `null` | no |
| <a name="input_sse_algorithm"></a> [sse\_algorithm](#input\_sse\_algorithm) | Server-side encryption algorithm for default object encryption (AES256 or aws:kms). | `string` | `"AES256"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags applied to all resources managed by this module. | `map(string)` | `{}` | no |
| <a name="input_versioning_enabled"></a> [versioning\_enabled](#input\_versioning\_enabled) | Controls whether bucket versioning is enabled. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | ARN of the S3 bucket. |
| <a name="output_bucket_id"></a> [bucket\_id](#output\_bucket\_id) | ID of the S3 bucket. |
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | Name of the S3 bucket. |
| <a name="output_bucket_regional_domain_name"></a> [bucket\_regional\_domain\_name](#output\_bucket\_regional\_domain\_name) | Regional domain name of the S3 bucket. |
<!-- END_TF_DOCS -->
