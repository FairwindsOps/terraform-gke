## vpc-native-beta-v1.5.0
* Prepares module for compatibility with future 4.x GCP provider
## vpc-native-beta-v1.4.5
* The initial node_pool needs to have a n2d machine type if confidential nodes are enabled
## vpc-native-beta-v1.4.4
* Fix typo var name var.enabled_confidential_nodes -> var.enable_confidential_nodes
## vpc-native-beta-v1.4.3
* Added var.enabled_confidential_nodes to allow deploying using confidential nodes
## vpc-native-beta-v1.4.2
* Added parameters for enabling GKE usage metering
## vpc-native-beta-v1.4.1
* Added the ability to use shielded nodes in a cluster
### Initial Release
* GKE Module that supports private and public cluster settings with beta features using the `google-beta` provider.
