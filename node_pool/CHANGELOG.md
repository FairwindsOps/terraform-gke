# node-pool-v3.0.0
## breaking change
- Updated module to support terraform >= 0.12

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
