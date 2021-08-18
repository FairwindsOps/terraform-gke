# Terraform VPC Native GKE Cluster Module

Requirements:
`terraform` >= `0.12.x`
terraform provider `google` >= `2.5.0`

This module manages a Google Kubernetes Engine (GKE) VPC Native cluster. The subnet CIDRs used for cluster nodes, pods, and services, are specified in the form of existing Google Compute secondary IP ranges. Use a separate Terraform module, such as [this `terraform-gcp-vpc-native/default` one](https://github.com/FairwindsOps/terraform-gcp-vpc-native/tree/master/default), to create these network resources in advance.

To provision a cluster with a private kubernetes api or a private node group, specify `enable_private_endpoint` and/or `enable_private_nodes`. If either private booleans are true, `master_ipv4_cidr_block` MUST be declared.

For example: To have a Public API and private node groups, set `enable_private_nodes` to `true` and `master_ipv4_cidr_block` to a `x.x.x.x/28` IP range.

See the file [example-usage](./example-usage) for an example of how to use this module. Below are the available module inputs:
| Parameter                          | Description                                         | Default                                 |
|------------------------------------|-----------------------------------------------------|-----------------------------------------|
| `region`                           | GKE region                                          | `None`                                  |
| `name`                             | Name of the GKE cluster                             | `None`                                  |
| `project`                          | GCP Project                                         | `""`                                    |
| `network_name`                     | Existing google_compute_network                     | `None`                                  |
| `nodes_subnetwork_name`            | Existing google_compute_subnetwork                  | `None`                                  |
| `kubernetes_version`               | minimum version of master nodes                     | `None`                                  |
| `pods_secondary_ip_range_name`     | IP range to be used for pods                        | `None`                                  |
| `services_secondary_ip_range_name` | IP range to be used for services                    | `None`                                  |
| `master_authorized_network_cidrs`  | List of maps with authorized cidrs and descriptions | `see inputs.tf`                         |
| `maintenance_policy_start_time`    | Maintenance Window (GMT)                            | `06:00`                                 |
| `enable_private_endpoint`          | Private Kube API endpoint                           | `false`                                 |
| `enable_private_nodes`             | Private compute instances                           | `false`                                 |
| `enable_workload_identity`         | Enable workload identity for the cluster            | `false`                                 |
| `master_ipv4_cidr_block`           | IPV4 CIDR block for controlplane (must be /28)      | `null`                                  |
| `monitoring_service`               | The monitoring service to write metrics to          | `monitoring.googleapis.com/kubernetes`  |
| `logging_service`                  | The logging service to write logs to                | `logging.googleapis.com/kubernetes`     |
| `vpa_enabled`                      | A boolean to enable VPA for the cluster             | `false`                                 |
| `enable_workload_identity`         | A boolean to enable workload identity               | `false`                                 |
| `enable_shielded_nodes`            | A boolean to enable cluster-wide shielded nodes     | `false`                                 |
| `enable_node_local_dns_cache`      | A boolean to enable NodeLocal DNSCache              | `true`                                  |
| `metering_bigquery_dataset`        | BigQuery dataset name to send GKE metering data to. Setting a value here implicitly enables GKE Usage Metering. | `""`    |
| `enable_network_egress_metering`   | Boolean to turn on Network Egress Metering. Only useful if metering_bigquery_dataset variable is set.           | `false` |
| `enable_confidential_nodes`       | Boolean to turn on confidential nodes for the cluster.                              | `false` |
| `confidential_nodes_initial_machine_type` | Initial node_pool that is removed should get an n2d machine type even though it will get removed after creation. | `n2d-standard-2` |
