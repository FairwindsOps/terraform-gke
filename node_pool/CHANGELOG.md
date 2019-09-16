# node-pool-v2.0.0
- Added tags to be able to assign specific firewall rules to node pools in GCP - NOTE: Adding tags to nodepools _WILL RECREATE YOUR NODE POOL_! Use this option carefully!
- Upgrade Notes:
  - Upgrading from `v1.x` will cause your node-pool to be recreated, even with no changes to your parameters. This is due to how the entropy names work. If you need features in `v2.x` you will first need to upgrade, recreate your node-pools, then use the new paramter features.

# node-pool-v1.0.1
- Change deprecation of region to conform to `location` parameter (Non-breaking change, resources should be safe)
