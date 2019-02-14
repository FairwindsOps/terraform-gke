# Determine the latest available GKE engine versions in the region.
# THis information is made available as convenient module outputs,
# to aide selecting a new GKE version prior to upgrading.
# The latest version is not directly used by this module when creating or upgrading clusters.

data "google_container_engine_versions" "latest" {
  region = "${var.region}"
}

output "latest_available_gke_master_version" {
  description = "The latest available GKE master version in the same region as the cluster. This is designed to be a quick way to get the latest master version when planning cluster upgrades."
  value       = "${data.google_container_engine_versions.latest.latest_master_version}"
}

output "latest_available_gke_node_version" {
  description = "The latest available GKE node version in the same region as the cluster. This is designed to be a quick way to get the latest master version when planning cluster upgrades."
  value       = "${data.google_container_engine_versions.latest.latest_node_version}"
}
