variable "name" {
  description = "The name of the node pool. A random string will be appended to this name, to allow replacement node pools to be created before destroying the current pool."
}

variable "gke_cluster_name" {
  description = "The name of the GKE cluster to bind this node pool."
}

variable "region" {
  description = "The region for the node pool."
}

variable "initial_node_count" {
  description = "The initial node count for the pool, per availability zone. Changing this will force recreation of the resource."
  default     = "1"
}

variable "min_node_count" {
  description = "Minimum number of nodes for autoscaling, per availability zone."
}

variable "max_node_count" {
  description = "Maximum number of nodes for autoscaling, per availability zone."
}

variable "kubernetes_version" {
  description = "The kubernetes version for the nodes in the pool. This should match the Kubernetes version of the GKE cluster."
}

variable "machine_type" {
  description = "The machine type of nodes in the pool."
  default     = "n1-standard-4"
}

variable "disk_size_in_gb" {
  description = "Disk size, in GB, for the nodes in the pool."
  default     = "100"
}

variable "node_tags" {
  type        = list
  description = "List of strings for tags on node pool VMs. These are generally used for firewall rules."
  default     = []
}

variable "node_labels" {
  description = "Key Value Pairs of Labels to add to the nodes in the pool"
  type        = map
  default     = {}
}

variable "disk_type" {
  description = "Type of the disk attached to each node"
  default     = "pd-standard"
}

variable "additional_oauth_scopes" {
  type        = list
  description = "List of strings for additional oauth scope in a node config"
  default     = []
}

variable "auto_repair" {
  description = "Whether the nodes will be automatically repaired"
  default     = true
}


variable "auto_upgrade" {
  description = "Whether the nodes will be automatically upgraded"
  default     = false
}
