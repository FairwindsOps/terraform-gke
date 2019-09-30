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

#### taint

Description: Key value pairs of taints to apply on nodes in the pool

Type: `map`

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

#### node\_tags

Description: List of strings for tags on node pool VMs. These are generally used for firewall rules.

Type: `list`

Default:

```json
[]
```


## Future To-do Items

* Perform additional testing  of conditions that will cause Terraform to recreate the node pool, based on the `keeper`s defined in the `random_id` resource.
* Determine whether, depending on results from the above testing, the node pool should have a `create_before_destroy` lifecycle.
* Do we want to be able to enable auto-upgrade on node pools?
* Do we want to be able to set taints on node pools?
* Do we want to enable auto-repair always on node pools?