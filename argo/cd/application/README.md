# Argo CD Application

## Links

- [ArgoCD Example Apps](https://github.com/argoproj/argocd-example-apps)

## Guides

- [Declarative Setup](https://argoproj.github.io/argo-cd/operator-manual/declarative-setup/)
- [Tracking and Deployment Strategies](https://argoproj.github.io/argo-cd/user-guide/tracking_strategies/)

## Bootstrap

```sh
#
kubens argocd
# kubens gitops

#
kubectl get appprojects.argoproj.io

#
cat << EOF | kubectl apply \
  -f -
apiVersion: argoproj.io/v1alpha1
kind: AppProject
metadata:
  name: <app-name>
  labels:
    acceptance: 'true'
  finalizers:
    - resources-finalizer.argocd.argoproj.io
spec:
  description: <app-description>
  sourceRepos:
    - '*'
  # orphanedResources:
  #   warn: true
  destinations:
    - name: in-cluster
      namespace: <app-namespace>
      server: https://kubernetes.default.svc
  # clusterResourceWhitelist:
  #   - group: '*'
  #     kind: '*'
  # namespaceResourceWhitelist:
  #   - group: '*'
  #     kind: '*'
EOF
```

## Usage

```sh
#
argocd app list

#
argocd app set '<app-name>' \
  -p "$DOCKER_REGISTRY/$DOCKER_REPOSITORY=$DOCKER_REGISTRY/$DOCKER_REPOSITORY:$DOCKER_TAG"

#
argocd app sync '<app-name>' --prune

#
argocd app wait '<app-name>'

#
argocd app history '<app-name>'

#
argocd app delete '<app-name>'
```

<!--
argocd app get <app-name>
-->

## Issues

### Degraded

```log
Access the cluster and debug the namespace of the project.
```

TODO
