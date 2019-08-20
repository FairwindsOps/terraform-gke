resource "google_container_cluster" "cluster" {
  name               = "${var.name}"
  location           = "${var.region}"
  min_master_version = "${var.kubernetes_version}"
  network            = "${var.network_name}"
  subnetwork         = "${var.nodes_subnetwork_name}"

  ip_allocation_policy {
    cluster_secondary_range_name  = "${var.pods_secondary_ip_range_name}"
    services_secondary_range_name = "${var.services_secondary_ip_range_name}"
  }

  # This is believed to apply to the default node pool, which gets created then deleted.
  initial_node_count       = 1
  remove_default_node_pool = true

  # The absence of a user and password here disables basic auth
  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  # Disable automatic kubernetes dashboard
  addons_config {
    kubernetes_dashboard {
      disabled = true
    }
  }

  network_policy {
    enabled = true
  }

  master_authorized_networks_config = {
    cidr_blocks = "${var.master_authorized_network_cidrs}"
  }

  maintenance_policy {
    daily_maintenance_window {
      start_time = "${var.maintenance_policy_start_time}"
    }
  }

  resource_labels {
    kubernetescluster = "${var.name}"
  }

  lifecycle {
    # ignore changes to node_pool specifically so it doesn't
    #   try to recreate default node pool with every change
    # ignore changes to network and subnetwork so it doesn't
    #   clutter up diff with dumb changes like:
    #   projects/[name]/regions/us-central1/subnetworks/[name]" => "name"
    ignore_changes = ["node_pool", "network", "subnetwork"]
  }
}
