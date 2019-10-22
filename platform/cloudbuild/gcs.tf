resource "google_storage_bucket" "artifacts-bucket" {
  name     = "${var.project_id}-artifacts"
  location = "${var.location}"
  project  = "${var.project_id}"
}
