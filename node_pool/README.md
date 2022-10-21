# Terraform GKE Node Pool Module

This module manages a node pool attached to a Google Kubernetes Engine (GKE) cluster.

## Using The Terraform Module

This module requires version 2.0.0 or above of the Google Terraform provider.

See the file [example-usage](./example-usage) for an example of how to use this module. Below are the available module inputs:

### Required Inputs

The following input variables are required:

#### gke\_cluster\_name

Description: The name of the GKE cluster to bind this node pool.

Type: `string`

#### kubernetes\_version

Description: The kubernetes version for the nodes in the pool. This should match the Kubernetes version of the GKE cluster.

Type: `string`

#### max\_node\_count

Description: Maximum number of nodes for autoscaling, per availability zone.

Type: `string`

#### min\_node\_count

Description: Minimum number of nodes for autoscaling, per availability zone.

Type: `string`

#### name

Description: The name of the node pool. A random string will be appended to this name, to allow replacement node pools to be created before destroying the current pool.

Type: `string`

#### region

Description: The region for the node pool.

Type: `string`

### Optional Inputs

The following input variables are optional (have default values):

#### disk\_size\_in\_gb

Description: Disk size, in GB, for the nodes in the pool.

Type: `string`

Default: `"100"`

#### disk\_type

Description: Type of the disk attached to each node

Type: `string`

Default: `"pd-standard"`

#### initial\_node\_count

Description: The initial node count for the pool, per availability zone. Changing this will force recreation of the resource.

Type: `string`

Default: `"1"`

#### machine\_type

Description: The machine type of nodes in the pool.

Type: `string`

Default: `"n1-standard-4"`

#### node\_labels

Description: Key Value Pairs of Labels to add to the nodes in the pool

Type: `map`

Default:

```json
{}
```

#### node\_metadata

Description: Defines how to expose the node metadata to the workload running on the node. Acceptable options are `UNSPECIFIED`, `SECURE`, `EXPOSE`, and `GKE_METADATA_SERVER`. `GKE_METADATA_SERVER` will enable [workload identity](https://cloud.google.com/kubernetes-engine/docs/how-to/workload-identity) for the node pool. See the provider [docs here](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster#workload_metadata_config) for more details.

Type: `string`

Default: `UNSPECIFIED`

#### node\_tags

Description: List of strings for tags on node pool VMs. These are generally used for firewall rules.

Type: `list`

Default:

```json
[]
```

#### additional\_oauth\_scope

Description: List of strings for additional oauth scope in a node config

Type: `list`

Default:

```json
[]
```

#### auto\_repair

Description: Whether the nodes will be automatically repaired

Type: `bool`

Default: `true`

#### auto\_upgrade

Description: Whether the nodes will be automatically upgraded

Type: `bool`

Default: `false`

#### preemptible\_nodes

Description: Whether to use preemptible nodes

Type: `bool`

Default: `false`

#### image_type

Description: The OS image to be used for the nodes.

Type: `string`

Default: none

#### spot_nodes

Description: Whether to use spot nodes in this pool.

Type: `bool`

Default: `false`

#### enable_secure_boot

Description: If shielded nodes is enabled at the cluster level, you can optionally set this to enable secure boot on shielded nodes.

Type: `bool`

Default: `false`

#### taint

Description: Dictionary of effect, key and value to apply on nodes in pool. Only one is allowed.

Type: `map`

Default: `null`

## Future To-do Items
* Do we want to be able to enable auto-upgrade on node pools?
* Do we want to enable auto-repair always on node pools?
