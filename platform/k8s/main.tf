resource "google_container_cluster" "primary" {
  provider = "google-beta"

  name     = "flowers-cluster"
  location = "${var.location}"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 2

  addons_config {
    istio_config {
      disabled = false
    }
  }

  network_policy {
    enabled = true
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "flowers-node-pool"
  location   = "${var.location}"
  cluster    = "${google_container_cluster.primary.name}"
  project    = "${var.project_id}"
  node_count = 2

  node_config {
    preemptible  = true
    machine_type = "f1-micro"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

