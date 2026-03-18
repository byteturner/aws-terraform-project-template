# cloudwatch-log-group-basic

Runnable example that composes the `labels` and `cloudwatch-log-group` modules.

## What this example shows

- Building a normalized name prefix and common tags with `modules/labels`
- Creating a log group with `modules/cloudwatch-log-group`
- Using a naming pattern like `/aws/<name-prefix>/<suffix>`

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
