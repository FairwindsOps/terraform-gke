# Terraform Public VPC Native GKE Cluster Module

This module manages a public Google Kubernetes Engine (GKE) VPC Native cluster. The subnet CIDRs used for cluster nodes, pods, and services, are specified in the form of existing Google Compute secondary IP ranges. Use a separate Terraform module, such as [this `terraform-gcp-vpc-native` one](https://github.com/reactiveops/terraform-gcp-vpc-native), to create these network resources in advance.

## Using The Terraform Module

See the file [example-usage](./example-usage) for an example of how to use this module. Below are the available module inputs:

### Required Inputs

The following input variables are required:

#### kubernetes\_version

Description: The minimum version of master nodes. This can be changed to upgrade the cluster - remember to upgrade the Kubernetes version for node pools (managed separately).

Type: `string`

#### name

Description: The name of the GKE cluster

Type: `string`

#### network\_name

Description: The name of an existing google_compute_network resource to which the cluster will be connected.

Type: `string`

#### nodes\_subnetwork\_name

Description: The name of an existing google_compute_subnetwork resource where cluster compute instances are launched.

Type: `string`

#### pods\_secondary\_ip\_range\_name

Description: The name of an existing network secondary IP range to be used for pods.

Type: `string`

#### region

Description: The region where the GKE cluster will be created.

Type: `string`

#### services\_secondary\_ip\_range\_name

Description: The name of an existing network secondary IP range to be used for services.

Type: `string`

### Optional Inputs

The following input variables are optional (have default values):

#### maintenance\_policy\_start\_time

Description: The time (in GMT) when the cluster maintenance window will start.

Type: `string`

Default: `"06:00"`

#### master\_authorized\_network\_cidrs

Description: A list of up to 20 maps containing `master_authorized_network_cidrs` and `display_name` keys, representing source network CIDRs that are allowed to connect master nodes over HTTPS.

Type: `list`

Default:

```json
[
  {
    "cidr_block": "0.0.0.0/0",
    "display_name": "everywhere"
  }
]
```

#### project

Description: The project where the GKE cluster will be created. Leave unspecified to use the project from the provider.

Type: `string`

Default: `""`

### Outputs

The following outputs are exported:

#### endpoint

Description: The GKE Cluster Endpoints IP

#### kubernetes\_version

Description: The Kubernetes version used when creating or upgrading this cluster. This does not reflect the current version of master or worker nodes.

#### latest\_available\_gke\_master\_version

Description: The latest available GKE master version in the same region as the cluster. This is designed to be a quick way to get the latest master version when planning cluster upgrades.

#### latest\_available\_gke\_node\_version

Description: The latest available GKE node version in the same region as the cluster. This is designed to be a quick way to get the latest master version when planning cluster upgrades.

#### master\_version

Description: The current version of the Kubernetes master nodes, which will differ from the kubernetes_version output if GKE upgrades masters automatically.

#### name

Description: The static name of the GKE cluster

#### region

Description: The region in which this cluster exists


## Future To-do Items

* Add inputs related to private VPC Native clusters, that default to false. These can be supplied by the private cluster Terraform module, which will call **this** module.
