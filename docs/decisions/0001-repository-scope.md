# 0001 - Repository scope

## Status

Accepted

## Context

This repository is a starting point for AWS Terraform projects that need:

- a minimal root module baseline
- reusable child modules for common patterns
- runnable examples kept separate from the root apply path
- repository-level quality checks and CI

A single published Terraform module would be too narrow for that scope.

## Decision

- Keep the root module intentionally minimal and safe by default.
- Keep examples outside the root module so they can be run independently.
- Keep reusable patterns in `modules/` and document them with generated references.
- Keep local and CI quality checks aligned.

## Consequences

- Teams can adopt the repository with a small default apply surface.
- Reusable modules and examples can evolve without changing root behavior.
- Quality and documentation standards stay consistent across local development and CI.
