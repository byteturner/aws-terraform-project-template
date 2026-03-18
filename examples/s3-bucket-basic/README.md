# s3-bucket-basic

Runnable example that composes the `labels` and `s3-bucket` modules.

## What this example shows

- Building a normalized name prefix and common tags with `modules/labels`
- Creating an S3 bucket with `modules/s3-bucket`
- Passing shared tags from `module.labels.tags`

## Run this example

```bash
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform validate
terraform plan
```

Apply only when you are ready to create resources:

```bash
terraform apply
```

S3 bucket names are globally unique. Update `project_name`, `environment`, `bucket_suffix`, or `bucket_name_override` if the generated name is already taken.
