# Terraform Public VPC Native GKE Cluster Module

This module manages a public Google Kubernetes Engine (GKE) VPC Native cluster. The subnet CIDRs used for cluster nodes, pods, and services, are specified in the form of existing Google Compute secondary IP ranges. Use a separate Terraform module, such as [this `terraform-gcp-vpc-native` one](https://github.com/FairwindsOps/terraform-gcp-vpc-native), to create these network resources in advance.

## Using The Terraform Module

This module requires version 2.0.0 or above of the Google Terraform provider.

See the file [example-usage](./example-usage) for an example of how to use this module. Below are the available module inputs:
