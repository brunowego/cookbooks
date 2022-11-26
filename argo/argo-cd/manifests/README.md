# Argo CD Manifests

## Links

- [ArgoCD Example Apps](https://github.com/argoproj/argocd-example-apps)

## Guides

- [Declarative Setup](https://argoproj.github.io/argo-cd/operator-manual/declarative-setup/)
- [Tracking and Deployment Strategies](https://argoproj.github.io/argo-cd/user-guide/tracking_strategies/)

## Project

```sh
#
kubectl get appprojects.argoproj.io \
  -n argo-system

#
cat << EOF | kubectl apply \
  -n argo-system \
  -f -
apiVersion: argoproj.io/v1alpha1
kind: AppProject
metadata:
  name: staging
  labels:
    acceptance: 'true'
  finalizers:
  - resources-finalizer.argocd.argoproj.io
spec:
  description: Staging project
  sourceRepos:
  - '*'
  orphanedResources:
    warn: true
  destinations:
  - namespace: '*'
    server: https://kubernetes.default.svc
  clusterResourceWhitelist:
  - group: '*'
    kind: '*'
  namespaceResourceWhitelist:
  - group: '*'
    kind: '*'
EOF
```

## Application

```sh
#
kubectl get applications.argoproj.io \
  -n argo-system
```

### Using K8s Manifests

```sh
#
cat << EOF | kubectl apply \
  -n argo-system \
  -f -
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: guestbook
  finalizers:
  - resources-finalizer.argocd.argoproj.io
spec:
  project: staging
  source:
    repoURL: https://github.com/argoproj/argocd-example-apps.git
    targetRevision: HEAD
    path: guestbook
    # directory:
    #   recurse: true
  destination:
    server: https://kubernetes.default.svc
    namespace: guestbook
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
    - PruneLast=true
    - CreateNamespace=true
EOF
```

### Using Helm

```sh
#
cat << EOF | kubectl apply \
  -n argo-system \
  -f -
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: helm-guestbook
  finalizers:
  - resources-finalizer.argocd.argoproj.io
spec:
  project: staging
  source:
    repoURL: https://github.com/argoproj/argocd-example-apps.git
    targetRevision: HEAD
    path: helm-guestbook
    # helm:
    #   version: v3
    #   # values: |
    #   valueFiles:
    #   - values-staging.yaml
  destination:
    server: https://kubernetes.default.svc
    namespace: helm-guestbook
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
    - PruneLast=true
    - CreateNamespace=true
EOF
```

### Using Kustomize

```sh
#
cat << EOF | kubectl apply \
  -n argo-system \
  -f -
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: kustomize-guestbook
  finalizers:
  - resources-finalizer.argocd.argoproj.io
spec:
  project: staging
  source:
    repoURL: https://github.com/argoproj/argocd-example-apps.git
    targetRevision: HEAD
    path: kustomize-guestbook
    # directory:
    #   recurse: true
  destination:
    server: https://kubernetes.default.svc
    namespace: kustomize-guestbook
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
    - PruneLast=true
    - CreateNamespace=true
EOF
```

## Issues

### Degraded

Access the cluster and debug the namespace of the project.
