resource "google_kms_key_ring" "flowers-keyring" {
  name     = "flowers-keyring"
  location = "${var.location}"
  project  = "${var.project_id}"
}

resource "google_kms_crypto_key" "flowers-kms-key" {
  name     = "flowers-kms-key"
  key_ring = "${google_kms_key_ring.flowers-keyring.self_link}"
}


