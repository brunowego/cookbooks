# Cluster Autoscaler on Kubernetes

## Issues

### TBD

```log
│ Error: Invalid template interpolation value
│
│   on .terraform/modules/kubernetes-addons.cluster-autoscaler.cluster_autoscaler_irsa_role/modules/iam-role-for-service-accounts-eks/policies.tf line 83, in data "aws_iam_policy_document" "cluster_autoscaler":
│   83:         variable = "autoscaling:ResourceTag/kubernetes.io/cluster/${statement.value}"
│     ├────────────────
│     │ statement.value is null
│
│ The expression result is null. Cannot include a null value in a string template.
```

TODO
