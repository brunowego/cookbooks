# Spot (a.k.a. spotinst)

## Links

- [Main Website](https://spot.io/)

## Helm

### References

- [Helm Chart](https://github.com/spotinst/spotinst-kubernetes-helm-charts/tree/master/charts/spotinst-kubernetes-cluster-controller)

### Repository

```sh
helm repo add spotinst 'https://spotinst.github.io/spotinst-kubernetes-helm-charts'
helm repo update
```

### Install

```sh
#
export SPOTINST_TOKEN=''
export SPOTINST_ACCOUNT=''
export CLUSTER_IDENTIFIER=''

#
helm install spotinst spotinst/spotinst-kubernetes-cluster-controller \
  --namespace kube-system \
  --version 1.0.93 \
  -f <(cat << EOF
spotinst:
  token: $SPOTINST_TOKEN
  account: $SPOTINST_ACCOUNT
  clusterIdentifier: $CLUSTER_IDENTIFIER
EOF
)
```

<!-- ### Issues

#### TBD

```log
Error: rendered manifests contain a resource that already exists. Unable to continue with install: APIService "v1beta1.metrics.k8s.io" in namespace "" exists and cannot be imported into the current release: invalid ownership metadata; annotation validation error: key "meta.helm.sh/release-name" must equal "spotinst": current value is "metrics-server"
```

TODO -->

### Delete

```sh
helm uninstall spotinst \
  -n kube-system
```

## Docs

### Auto-scaling

1. Main menu "Ocean"
2. Submenu "Cloud Clusters"
3. Click in the desired cluster name
4. "Actions" Button -> "Customize Scaling"
5. Turn on the "Auto-scaling" -> Save
