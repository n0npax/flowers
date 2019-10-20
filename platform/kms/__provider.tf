provider "google-beta" {
  project = "${var.project_id}"
  region  = "${var.location}"
}

terraform {
  backend "gcs" {
    bucket = "flowers-255011-terraform-state"
    prefix = "terraform/state/kms"
  }
}

