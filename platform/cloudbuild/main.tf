resource "google_cloudbuild_trigger" "flowers-trigger" {
  provider = "google-beta"

  trigger_template {
    branch_name = "master"
  }

  substitutions = {
    _BAZ = "qux"
  }

  github {
    owner = "n0npax"
    name  = "flowers"
  }

  included_files = ["core/**"]
  filename       = "core/cloudbuild.yaml"
}

