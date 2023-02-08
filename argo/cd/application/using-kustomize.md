# Argo CD Application using Kustomize

## Usage

```sh
kubectl get applications.argoproj.io
```

### Command Line

```sh
#
argocd app create \
  '<app-name>' \
  --repo '<git-repo-url>' \
  --path './k8s/overlays/<app-env>' \
  --dest-namespace '<app-namespace>' \
  --dest-server 'https://kubernetes.default.svc'

#
argocd app set '<app-name>' \
  --kustomize-image "$DOCKER_REGISTRY/$DOCKER_REPOSITORY:$DOCKER_TAG"
```

### Manifest

```sh
#
cat << EOF | kubectl apply \
  -f -
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: <app-name>
  finalizers:
    - resources-finalizer.argocd.argoproj.io
spec:
  project: <project-name>
  source:
    repoURL: <app-repo-url>
    targetRevision: HEAD
    path: .k8s/overlays/<app-env>
    kustomize:
      images:
        - <app-image>
  destination:
    server: https://kubernetes.default.svc
    namespace: <app-namespace>
  # syncPolicy:
  #   automated:
  #     prune: true
  #     selfHeal: true
  #   syncOptions:
  #   - PruneLast=true
  #   - CreateNamespace=true
EOF
```
