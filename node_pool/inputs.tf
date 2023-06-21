variable "gke_cluster_name" {
  description = "The name of the GKE cluster to bind this node pool."
}

variable "kubernetes_version" {
  description = "The kubernetes version for the nodes in the pool. This should match the Kubernetes version of the GKE cluster."
}

variable "max_node_count" {
  description = "Maximum number of nodes for autoscaling, per availability zone."
}

variable "min_node_count" {
  description = "Minimum number of nodes for autoscaling, per availability zone."
}

variable "name" {
  description = "The name of the node pool. A random string will be appended to this name, to allow replacement node pools to be created before destroying the current pool."
}

variable "region" {
  description = "The region for the node pool."
}

variable "node_locations" {
  type        = list
  description = "The list of zones in which the node pool's nodes should be located. Nodes must be in the region of their regional cluster or in the same region as their cluster's zone for zonal clusters. If unspecified, the cluster-level node_locations will be used."
  default     = null
}

variable "disk_size_in_gb" {
  description = "Disk size, in GB, for the nodes in the pool."
  default     = "100"
}

variable "disk_type" {
  description = "Type of the disk attached to each node"
  default     = "pd-standard"
}

variable "initial_node_count" {
  description = "The initial node count for the pool, per availability zone. This has been ignored on the node pool module resource. Remove it from ignore_changes if you want to set it yourself, but 1 is usually sufficient."
  default     = "1"
}

variable "machine_type" {
  description = "The machine type of nodes in the pool."
  default     = "n1-standard-4"
}

variable "node_labels" {
  description = "Key Value Pairs of Labels to add to the nodes in the pool"
  type        = map
  default     = {}
}

variable "node_metadata" {
  description = "Specifies how node metadata is exposed to the workload running on the node. Set to `GKE_METADATA` to enable workload identity"
  default     = "UNSPECIFIED"
  type        = string
}

variable "node_tags" {
  type        = list
  description = "List of strings for tags on node pool VMs. These are generally used for firewall rules."
  default     = []
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

variable "preemptible_nodes" {
  description = "Whether to use preemptible nodes"
  default     = false
}

variable "image_type" {
  description = "The OS image to be used for the nodes."
  default     = "COS"
}

variable "spot_nodes"{
  type        = bool
  description = "Whether to use spot nodes"
  default     = false
}

variable "enable_secure_boot" {
  type        = bool
  description = "If shielded nodes is enabled at the cluster level, you can optionally set this to enable secure boot on shielded nodes."
  default     = false
}

variable "taint" {
  description = "Dictionary of effect, key and value to apply on nodes in pool"
  type        = map
  default     = null
}

variable "timeout_create"{
  type        = string
  description = "Override default timeout for CREATE function"
  default     = "30m"
}

variable "timeout_delete"{
  type        = string
  description = "Override default timeout for DELETE function"
  default     = "30m"
}

variable "timeout_update"{
  type        = string
  description = "Override default timeout for UPDATE function"
  default     = "30m"
}