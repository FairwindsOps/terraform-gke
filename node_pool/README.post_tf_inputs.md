## Future To-do Items

* Perform additional testing  of conditions that will cause Terraform to recreate the node pool, based on the `keeper`s defined in the `random_id` resource.
* Determine whether, depending on results from the above testing, the node pool should have a `create_before_destroy` lifecycle.
