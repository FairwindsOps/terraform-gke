# Terraform Private VPC Native GKE Cluster Module

This module manages a private Google Kubernetes Engine (GKE) VPC Native cluster. The subnet CIDRs used for cluster nodes, pods, and services, are specified in the form of existing Google Compute secondary IP ranges. Use a separate Terraform module, such as [this `terraform-gcp-vpc-native/cloud-nat` one](https://github.com/FairwindsOps/terraform-gcp-vpc-native/tree/master/cloud-nat), to create these network resources in advance.

By default, the cluster will be provisioned with a private kubernetes api and a private node group. These are both configurable inputs. To have a Public API and private node groups, set `enable_private_endpoint` to `false`.

See the file [example-usage](./example-usage) for an example of how to use this module. Below are the available module inputs:
| Parameter                          | Description                                         | Default         |
|------------------------------------|-----------------------------------------------------|-----------------|
| `region`                           | GKE region                                          | `None`          |
| `name`                             | Name of the GKE cluster                             | `None`          |
| `project`                          | GCP Project                                         | `""`            |
| `network_name`                     | Existing google_compute_network                     | `None`          |
| `nodes_subnetwork_name`            | Existing google_compute_subnetwork                  | `None`          |
| `kubernetes_version`               | minimum version of master nodes                     | `None`          |
| `pods_secondary_ip_range_name`     | IP range to be used for pods                        | `None`          |
| `services_secondary_ip_range_name` | IP range to be used for services                    | `None`          |
| `master_authorized_network_cidrs`  | List of maps with authorized cidrs and descriptions | `see inputs.tf` |
| `maintenance_policy_start_time`    | Maintenance Window (GMT)                            | `06:00`         |
| `enable_private_endpoint`          | Private Kube API endpoint                           | `true`          |
| `enable_private_nodes`             | Private compute instances                           | `true`          |
| `master_ipv4_cidr_block`           | IPV4 CIDR block for controlplane (must be /28)      | `None`          |
