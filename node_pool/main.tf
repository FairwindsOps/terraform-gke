# IMPORTANT
## Please BE CAREFUL when chnging `keepers`. If you add a keeper
## then this will cause a CREATATION CASCADE! Since a new keeper
## triggers a new resource random to generate then it will change
## the name of the node pool, which will recrete the resource!
## This is the preferred method for random naming now that
## name-prefix is being deprecated!
## IF YOU ADD A KEEPER YOU WILL NEED TO WARN DOWNSTREAM USERS THAT
## IT WILL TRIGGER A CASCADING NODEPOOL REPLACEMENT.
## The replacement should be safe because of the create_before_destroy
## but will cause some questions and confusion.
## All the current keepers are bound to params that will already cause
## a -/+ operation for the nodepool.
# https://github.com/terraform-providers/terraform-provider-google/issues/1054
resource "random_id" "entropy" {
  keepers {
    machine_type = "${var.machine_type}"
    name         = "${var.name}"
    region       = "${var.region}"
    disk_size    = "${var.disk_size_in_gb}"
  }

  byte_length = 2
}

resource "google_container_node_pool" "node_pool" {
  name               = "${var.name}-${random_id.entropy.hex}"
  cluster            = "${var.gke_cluster_name}"
  region             = "${var.region}"
  version            = "${var.kubernetes_version}"
  initial_node_count = 1

  autoscaling {
    min_node_count = "${var.min_node_count}"
    max_node_count = "${var.max_node_count}"
  }

  node_config {
    image_type   = "COS"
    disk_size_gb = "${var.disk_size_in_gb}"
    machine_type = "${var.machine_type}"

    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/compute",
    ]
  }

  lifecycle {
    create_before_destroy = true
  }
}
