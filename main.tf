# Intentionally minimal root module:
# - keeps the default apply path safe at repository start
# - establishes a clean baseline for future module composition
#
# Reusable child modules, snippets, and runnable examples are introduced incrementally
# and remain isolated from this root module unless explicitly wired in.

module "labels" {
  source = "./modules/labels"

  project_name    = var.project_name
  environment     = var.environment
  owner           = var.owner
  cost_center     = var.cost_center
  additional_tags = var.additional_tags
}
