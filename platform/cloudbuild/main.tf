locals {
  apps = distinct([
    for file_name in fileset("../../apps", "**/cloudbuild.yaml") :
    dirname(file_name)
  ])
}

output "apps" {
  value = "${local.apps}"
}

resource "google_cloudbuild_trigger" "flowers-trigger" {
  for_each    = toset(local.apps)
  provider    = "google-beta"
  disabled    = false
  description = "APP: ${each.value}"
  substitutions = {
    _ENV           = "${var.env}"
    _BUILDER_IMAGE = "temp-image-${each.value}"
  }

  github {
    owner = "n0npax"
    name  = "flowers"
    push {
      branch = "${var.branch}"
    }
  }
  included_files = ["apps/${each.value}/**"]
  filename       = "apps/${each.value}/cloudbuild.yaml"
}

resource "google_cloudbuild_trigger" "platform-trigger" {
  provider    = "google-beta"
  disabled    = false
  description = "Platform"
  substitutions = {
    _ENV = "${var.env}"
  }

  github {
    owner = "n0npax"
    name  = "flowers"
    push {
      branch = "${var.branch}"
    }
  }
  included_files = ["platform/**"]
  filename       = "platform/cloudbuild.yaml"
}

