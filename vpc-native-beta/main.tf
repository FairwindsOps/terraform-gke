locals {
  base_oauth_scope = [
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
    "https://www.googleapis.com/auth/compute",
  ]
}

module "beta-vpc-native-cluster" {
  source                     = "terraform-google-modules/kubernetes-engine/google//modules/beta-public-cluster"
  
  # these vars are provided by user in main.tf
  project_id                 = var.project
  name                       = var.name
  region                     = var.region
  kubernetes_version         = var.kubernetes_version
  node_version               = var.kubernetes_version
  network                    = var.network_name
  subnetwork                 = var.nodes_subnetwork_name
  ip_range_pods              = var.pods_secondary_ip_range_name
  ip_range_services          = var.services_secondary_ip_range_name

  # these vars will be pulled from inputs.tf
  monitoring_service         = var.monitoring_service
  logging_service            = var.logging_service

  remove_default_node_pool = true




  # unclear if we can enable private endpoints
  
  # search this page for "configure_ip_masq" and read the variable description:
  # https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/5.0.0/submodules/beta-private-cluster

  # here's the stuff from the non-beta cluster module:
  #   private_cluster_config {
  # enable_private_endpoint = var.enable_private_endpoint
  # enable_private_nodes    = var.enable_private_nodes
  # master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  #}




  # Search this page for "policy provider" if you'd like to specify network policy config provider: 
  # https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/5.0.0/submodules/beta-private-cluster
  network_policy = true

  master_authorized_networks_config {
    dynamic "cidr_blocks" {
      for_each = var.master_authorized_network_cidrs
      content {
        # TF-UPGRADE-TODO: The automatic upgrade tool can't predict
        # which keys might be set in maps assigned here, so it has
        # produced a comprehensive set here. Consider simplifying
        # this after confirming which keys can be set in practice.
        cidr_block   = cidr_blocks.value.cidr_block
        display_name = lookup(cidr_blocks.value, "display_name", null)
      }
    }
  }

  maintenance_window = var.maintenance_policy_start_time

  cluster_resource_labels = {
    kubernetescluster = var.name
  }

  node_pools = [
    for node_pool in var.node_pools:
    node_pool.value
  ]

  node_pools_oauth_scopes = {
    for node_pool in var.node_pools:
    node_pool.basics.name = concat(local.base_oauth_scope, var.node_pool.additional_oauth_scopes)
  } 

  node_pools_labels = {
    for node pool in var.node_pools:
    node_pool.basics.name = node_pool.labels
  }

  node_pools_taints = {
    for node_pool in var.node_pools:
    node_pool.basics.name = node_pool.taints
  }
  
  node_pools_tags = {
    for node_pool in var.node_pools:
    node_pool.basics.name = node_pool.tags
  }

  lifecycle {
    # ignore changes to node_pool specifically so it doesn't
    #   try to recreate default node pool with every change
    # ignore changes to network and subnetwork so it doesn't
    #   clutter up diff with dumb changes like:
    #   projects/[name]/regions/us-central1/subnetworks/[name]" => "name"
    ignore_changes = [
      node_pool,
      network,
      subnetwork,
    ]

    create_before_destroy = true
  }
}
