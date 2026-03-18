terraform {
  # Supply environment-specific backend settings externally (for example via -backend-config).
  backend "s3" {
    use_lockfile = true
  }
}
