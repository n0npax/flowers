locals {
  perms = distinct([
    "container.admin",
    "firebase.admin",
    "storage.admin",
    "monitoring.admin",
    "logging.admin",
    "pubsub.admin",
    "cloudkms.admin",
  ])
}

data "google_iam_policy" "cloudbuild-iam-platform" {
  for_each = toset(local.perms)
  provider = "google-beta"

  binding {
    role = "${each.value}"

    members = [
      "serviceAccount:${var.cloudbuild_sa}",
    ]
  }

  binding {
    role = "${each.value}"

    members = [
      "user:marcin.niemira@gmail.com",
    ]
  }
}


