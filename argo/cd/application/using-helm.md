# Argo CD Application using Helm

## Links

- [Docs](https://argo-cd.readthedocs.io/en/stable/user-guide/helm/)

## Usage

```sh
#
kubectl get applications.argoproj.io
```

### Command Line

```sh
#
argocd app create \
  '<app-name>' \
  --dest-namespace '<app-namespace>' \
  --dest-server 'https://kubernetes.default.svc' \
  --helm-chart '<helm-chart>' \
  --project '<project-name>' \
  --repo '<helm-repo-url>' \
  --revision '<helm-version>' \
  --values-literal-file './.helm/values.yml'

# ex.:
argocd app create \
  'backstage' \
  --dest-namespace 'catalog' \
  --dest-server 'https://kubernetes.default.svc' \
  --helm-chart 'backstage' \
  --project 'backstage' \
  --repo 'https://backstage.github.io/charts' \
  --revision '0.14.0' \
  --values-literal-file './.helm/values.yml'
```

<!--
--helm-set <parameter>=<value>
-->

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
    #     - values-staging.yaml
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

## Issues

### Missing Revision

```log
FATA[0001] rpc error: code = InvalidArgument desc = application spec for backstage is invalid: InvalidSpecError: Unable to generate manifests in : rpc error: code = Unknown desc = invalid revision '': improper constraint:
```

Missing `--revision` flag.
