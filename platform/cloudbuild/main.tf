locals {
  apps = distinct([
    for file_name in fileset("../../apps", "**/cloudbuild.yaml") :
    dirname(file_name)
  ])
}

output "apps" {
  value = "${local.apps}"
}

data "google_kms_secret" "codecov-token" {
  crypto_key = "${var.project_id}/australia-southeast1/flowers-keyring/flowers-kms-key"
  ciphertext = "CiQAawvYIpauodPFICusVyYpJwiEWK2PbOTIS/Dg29lBaUC34VkSTQBuQEe54M7mBQUnWeUX24UCbOQjiStg0odc187nB+UY0CUhqxrxNIH7OUlJNfzhJToWQOwyfQ+K5EsWiCL1MuiHaeUgOkFHgPdPO60R"
}

resource "google_cloudbuild_trigger" "flowers-trigger" {
  for_each    = toset(local.apps)
  provider    = "google-beta"
  project     = "${var.project_id}"
  disabled    = false
  description = "APP: ${each.value}"
  substitutions = {
    _ENV           = "${var.env}"
    _BUILDER_IMAGE = "temp-image-${each.value}"
    _CODECOV_TOKEN  = "${data.google_kms_secret.codecov-token.plaintext}"
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
  description = "PLATFORM"
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

