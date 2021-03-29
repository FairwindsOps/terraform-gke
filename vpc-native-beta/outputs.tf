output "name" {
  description = "The static name of the GKE cluster"
  value       = google_container_cluster.cluster.name
}

output "endpoint" {
  description = "The GKE Cluster Endpoints IP"
  value       = google_container_cluster.cluster.endpoint
}

## This is passed back out in case it's needed to inherit for node pools
output "kubernetes_version" {
  description = "The Kubernetes version used when creating or upgrading this cluster. This does not reflect the current version of master or worker nodes."
  value       = var.kubernetes_version
}

output "master_version" {
  description = "The current version of the Kubernetes master nodes, which will differ from the kubernetes_version output if GKE upgrades masters automatically."
  value       = google_container_cluster.cluster.master_version
}

output "region" {
  description = "The region in which this cluster exists"
  value       = var.region
}

