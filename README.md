# aws-terraform-project-template

A starter repository for AWS Terraform projects with a clean root module baseline, reusable child modules, and runnable examples.

## Quick start

```bash
cp terraform.tfvars.example terraform.tfvars
terraform init -backend=false
terraform validate
```

Then run one of the runnable examples in `examples/` to try the modules in isolation.

## Overview

Use this repository as a practical starting point for platform or application infrastructure on AWS. It keeps the default root module intentionally small, while providing reusable modules and quality checks that can be carried into long-lived projects.

## What's included

- Root module baseline with provider, backend, and input/output conventions
- Reusable modules for shared labels, S3 buckets, and CloudWatch log groups
- Environment example files under `envs/` for backend and variable inputs
- Runnable examples under `examples/` that compose modules in realistic patterns
- Local quality checks with pre-commit, terraform-docs, and tflint
- GitHub Actions CI that mirrors the local baseline

## Repository structure

- `.github/workflows/` — CI workflow
- `docs/decisions/` — repository decisions and rationale
- `envs/` — environment-specific `backend.hcl.example` and `terraform.tfvars.example`
- `examples/` — runnable module composition examples
- `modules/` — reusable Terraform child modules
- Root `*.tf` files — baseline root module configuration

## Reusable modules

- `modules/labels` — normalizes naming and tag conventions
- `modules/s3-bucket` — secure-by-default S3 bucket baseline
- `modules/cloudwatch-log-group` — CloudWatch log group with retention and optional KMS encryption

Each module README includes a focused usage example and generated input/output reference.

## Runnable examples

- `examples/s3-bucket-basic` — Creates a bucket with standardized names, tags, and secure defaults.
- `examples/cloudwatch-log-group-basic` — Creates a log group with standardized names, tags, and configurable retention.

Each example is self-contained and can be initialized and validated independently.

## Working with environments

The `envs/` directory provides per-environment example inputs:

- `envs/<environment>/backend.hcl.example`
- `envs/<environment>/terraform.tfvars.example`

These files are not loaded automatically. Copy them to local, non-example files and pass them explicitly to Terraform.

```bash
terraform init -reconfigure -backend-config=envs/dev/backend.hcl
terraform plan -var-file=envs/dev/terraform.tfvars
```

## Local quality checks

Install the local toolchain:

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [pre-commit](https://pre-commit.com/)
- [terraform-docs](https://terraform-docs.io/user-guide/installation/)
- [tflint](https://github.com/terraform-linters/tflint#installation)

Then run:

```bash
pre-commit install
pre-commit run --all-files
```

The configured checks cover formatting, validation, module README consistency, and Terraform linting.

## CI

GitHub Actions validates the root module and runs the repository quality baseline on pushes to `main` and pull requests targeting `main`.

The workflow runs:
- `terraform fmt -check -recursive`
- `terraform init -backend=false`
- `terraform validate`
- `pre-commit run --all-files`
- `terraform init` and `terraform validate` for runnable examples under `examples/`
