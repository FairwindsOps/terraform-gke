# Terraform GKE Node Pool Module

This module manages a node pool attached to a Google Kubernetes Engine (GKE) cluster.

## Using The Terraform Module

This module requires version 2.0.0 or above of the Google Terraform provider.

See the file [example-usage](./example-usage) for an example of how to use this module. Below are the available module inputs:


## Future To-do Items

* Perform additional testing  of conditions that will cause Terraform to recreate the node pool, based on the `keeper`s defined in the `random_id` resource.
* Determine whether, depending on results from the above testing, the node pool should have a `create_before_destroy` lifecycle.
* Do we want to be able to enable auto-upgrade on node pools?
* Do we want to be able to set taints on node pools?
* Do we want to enable auto-repair always on node pools?