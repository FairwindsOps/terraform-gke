variable "name" {
  description = "The name of the GKE cluster"
}

variable "region" {
  description = "The region where the GKE cluster will be created."
}

variable "project" {
  description = "The project where the GKE cluster will be created. Leave unspecified to use the project from the provider."
  default     = ""
}

variable "network_name" {
  description = "The name of an existing google_compute_network resource to which the cluster will be connected."
}

variable "nodes_subnetwork_name" {
  description = "The name of an existing google_compute_subnetwork resource where cluster compute instances are launched."
}

variable "kubernetes_version" {
  description = "The minimum version of master nodes. This can be changed to upgrade the cluster - remember to upgrade the Kubernetes version for node pools (managed separately)."
}

variable "pods_secondary_ip_range_name" {
  description = "The name of an existing network secondary IP range to be used for pods."
}

variable "services_secondary_ip_range_name" {
  description = "The name of an existing network secondary IP range to be used for services."
}

variable "master_authorized_network_cidrs" {
  type        = list
  description = "A list of up to 20 maps containing `master_authorized_network_cidrs` and `display_name` keys, representing source network CIDRs that are allowed to connect master nodes over HTTPS."

  default = [
    {
      ## this needs to be changed when enable_private_endpoint is true
      cidr_block   = "0.0.0.0/0"
      display_name = "everywhere"
    },
  ]
}

variable "maintenance_policy_start_time" {
  description = "The time (in GMT) when the cluster maintenance window will start."
  default     = "06:00"
}

variable "enable_private_endpoint" {
  description = "A boolean to enable private (non public) kube-api endpoints"
  default     = false
}

variable "enable_private_nodes" {
  description = "A boolean to enable private (non public) nodes"
  default     = false
}

variable "master_ipv4_cidr_block" {
  description = "The /28 range for the master instances. Must be set if enable_private_nodes or enable_private_endpoint is true"
  default     = null
}

variable "monitoring_service" {
  description = "The monitoring service to write metrics to"
  default     = "monitoring.googleapis.com/kubernetes"
}

variable "logging_service" {
  description = "The logging service to write logs to"
  default     = "logging.googleapis.com/kubernetes"
}
