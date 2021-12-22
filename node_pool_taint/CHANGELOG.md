# node-pool-taint-v2.3.0
- Prepares module for compatibility with future 4.x GCP provider
- Added image_type parameter to control the OS image of the node pool

# node-pool-taint-v2.2.0
- Added `node_metadata` parameter to control node metadata provided to workload, so that [workload identity](https://cloud.google.com/kubernetes-engine/docs/how-to/workload-identity) functionality may be used.

# node-pool-taint-v2.1.1
- patch fix to generate a new random id when the additional_oauth_scopes var changes because that forces the node pool to be replaced

# node-pool-taint-v2.0.0
## breaking change
- Updated module to support terraform >= 0.12

# node-pool-taint-v1.1.0
- added ability to add additional_oauth_scopes to node pools
  - NOTE: changing oauth scopes will recreate your node pool

# node-pool-taint-v1.0.0
Initial release of `node-pool-taint` which leverages the `google-beta` provider to apply taints to node pools. This module should be roughly equivalent with the features of `node-pool` in the same repository.
