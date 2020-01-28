# IMPORTANT
## Please BE CAREFUL when changing `keepers`. If you add a keeper
## then this will cause a CREATION CASCADE! Since a new keeper
## triggers a new `random_id` resource to generate then it will change
## the name of the node pool, which will recreate that resource!
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
  keepers = {
    machine_type       = var.machine_type
    name               = var.name
    region             = var.region
    disk_size          = var.disk_size_in_gb
    tags               = join(",", sort(var.node_tags))
    disk_type          = var.disk_type
    labels             = jsonencode(var.node_labels)
    initial_node_count = var.initial_node_count
  }

  byte_length = 2
}

locals {
  base_oauth_scope = [
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
    "https://www.googleapis.com/auth/compute",
    "https://www.googleapis.com/auth/ndev.clouddns.readwrite",
  ]
}

resource "google_container_node_pool" "node_pool" {
  name               = "${var.name}-${random_id.entropy.hex}"
  cluster            = var.gke_cluster_name
  location           = var.region
  version            = var.kubernetes_version
  initial_node_count = var.initial_node_count

  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  node_config {
    image_type   = "COS"
    disk_size_gb = var.disk_size_in_gb
    machine_type = var.machine_type
    labels       = var.node_labels
    disk_type    = var.disk_type
    tags         = var.node_tags

    oauth_scopes = concat(local.base_oauth_scope, var.additional_oauth_scopes)
  }

  management {
    auto_repair  = var.auto_repair
    auto_upgrade = var.auto_upgrade
  }

  lifecycle {
    create_before_destroy = true
  }
}

