# node-pool-v3.8.0
- Added the following values to ignore_changes on the node pool, since they aren't commonly configured but instead set by GKE: `initial_node_count`, `node_config.0.metadata` and `node_config.0.min_cpu_platform`

# node-pool-v3.7.0
- Added the ability to use spot vms on a node pool. This can be enabled by setting the variable `spot_nodes` to true. This can only be enabled on new node pools and cannot be toggled after creation. Can only be used with GKE 1.22+.

# node-pool-v3.6.0
- Prepares module for compatibility with future 4.x GCP provider
- Added image_type parameter to control the OS image of the node pool

# node-pool-v3.5.0
- Fixed taints so that Terraform won't error out if you don't specify them on a node pool

# node-pool-v3.4.0
- Added taints to node pool module (mandatory, mistakenly)

# node-pool-v3.3.1
- Added the ability to enable secure boot on nodes when the cluster uses shielded nodes. This can be enabled with the variable `enable_secure_boot`

# node-pool-v3.3.0
- Added `node_metadata` parameter to control node metadata provided to workload, so that [workload identity](https://cloud.google.com/kubernetes-engine/docs/how-to/workload-identity) functionality may be used.

# node-pool-v3.2.1
- patch fix to generate a new random id when the additional_oauth_scopes var changes because that forces the node pool to be replaced

# node-pool-v3.0.0
## breaking change
- Updated module to support terraform >= 0.12

# node-pool-v2.1.0
- Addded ability to add additional oauth scopes to a node pool
  - NOTE: changing oauth scopes will recreate your node pool

# node-pool-v2.0.0
- Added tags to be able to assign specific firewall rules to node pools in GCP - NOTE: Adding tags to nodepools _WILL RECREATE YOUR NODE POOL_! Use this option carefully!
- Added disk type to the node pool. Accepts the values 'pd-standard' or 'pd-ssd' _WILL RECREATE YOUR NODE POOL_! Use this option carefully!
- Added the ability to set the initial node count. The default value is 1. _WILL RECREATE YOUR NODE POOL_! Use this option carefully!
- Changing to this version will _WILL RECREATE YOUR NODE POOL_!
- Added the ability to add labels to nodes in a node pool _WILL RECREATE YOUR NODE POOL_! Use this option carefully!
- Upgrade Notes:
  - Upgrading from `v1.x` will cause your node-pool to be recreated, even with no changes to your parameters. This is due to how the entropy names work. If you need features in `v2.x` you will first need to upgrade, recreate your node-pools, then use the new paramter features.

# node-pool-v1.0.1
- Change deprecation of region to conform to `location` parameter (Non-breaking change, resources should be safe)
