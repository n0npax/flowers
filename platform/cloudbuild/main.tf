resource "google_cloudbuild_trigger" "flowers-trigger" {
  provider    = "google-beta"
  disabled    = false
  description = "core logic app"
  substitutions = {
    _ENV = "${var.env}"
    _PROJECT_ID = "${var.project_id}"
  }

  github {
    owner = "n0npax"
    name  = "flowers"
    push {
      branch = "${var.branch}"
    }
  }
  included_files = ["apps/core/**"]
  filename       = "apps/core/cloudbuild.yaml"
}

