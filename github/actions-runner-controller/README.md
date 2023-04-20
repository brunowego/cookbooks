# Actions Runner Controller (ARC)

## Links

- [Code Repository](https://github.com/actions/actions-runner-controller)
- [Troubleshooting](https://github.com/actions/actions-runner-controller/blob/master/TROUBLESHOOTING.md?plain=1)

## Helm

### Dependencies

#### GitHub App

1. Organization -> Settings
2. Developer settings -> GitHub Apps
3. New GitHub App
   - GitHub App name: Actions Runner Controller (ARC)
   - Homepage URL: `https://domain.tld`
   - Webhook -> Uncheck "Active"
   - Permissions / Repository permissions -> Actions: Read-only, Administration: Read and write
   - Create GitHub App
4. General tab / Private keys -> Generate a private key
5. Install App tab / Install
   - Repository access -> All repositories
   - Save

### References

- [Values](https://github.com/actions/actions-runner-controller/tree/master/charts/actions-runner-controller#values)

### Repository

```sh
helm repo add actions-runner-controller 'https://actions-runner-controller.github.io/actions-runner-controller'
helm repo update
```

### Install

```sh
# GitHub Actions Runner
kubectl create ns gar-system
# kubectl create ns pipeline

#
kubens gar-system

#
export GITHUB_APP_ID='<id>'
export GITHUB_APP_INSTALLATION_ID='<id>' # Get from URL https://github.com/organizations/<org>/settings/installations/<id>
export GITHUB_APP_PRIVATE_KEY='</path/to/actions-runner-controller-arc.*.private-key.pem>'

#
kubectl create secret generic controller-manager \
  --from-literal=github_app_id="$GITHUB_APP_ID" \
  --from-literal=github_app_installation_id="$GITHUB_APP_INSTALLATION_ID" \
  --from-file=github_app_private_key="$GITHUB_APP_PRIVATE_KEY"

#
kubectl get secret controller-manager \
  -o json | \
    jq '.data | map_values(@base64d)'

#
helm search repo -l actions-runner-controller/actions-runner-controller

#
helm install actions-runner-controller actions-runner-controller/actions-runner-controller \
  --version 0.22.0

#
kubectl get all
```

### Status

```sh
kubectl rollout status deployment/actions-runner-controller
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=actions-runner-controller' \
  -f
```

### Issues

#### TBD

```log
2023-04-17T11:33:17Z    ERROR   Reconciler error        {"controller": "runner-controller", "controllerGroup": "actions.summerwind.dev", "controllerKind": "Runner", "Runner": {"name":"k8s-runners-4mngk-kcstr","namespace":"pipeline"}, "namespace": "pipeline", "name": "k8s-runners-4mngk-kcstr", "reconcileID": "eeea0ade-9d51-4e8a-a82d-0bebf7fd4b6b", "error": "Internal error occurred: failed calling webhook \"mutate.runner.actions.summerwind.dev\": failed to call webhook: Post \"https://actions-runner-controller-webhook.pipeline.svc:443/mutate-actions-summerwind-dev-v1alpha1-runner?timeout=10s\": x509: certificate has expired or is not yet valid: current time 2023-04-17T11:33:17Z is after 2023-04-16T20:41:06Z"}
```

TODO

<!--
kubectl delete deployments.apps actions-runner-controller

helm upgrade actions-runner-controller actions-runner-controller/actions-runner-controller \                       130 ↵
  --version 0.22.0
-->

#### TBD

TODO

```sh
kubectl scale deployment actions-runner-controller --replicas 0

kubectl patch pod <pod-name> \
  -p '{"metadata":{"finalizers":[]}}' \
  --type='merge'

kubectl get pods | \
  awk '{if ($3=="NotReady") print "kubectl delete pod "$1" --force --grace-period=0 ";}' | \
    sh

kubectl scale deployment actions-runner-controller --replicas 1

kubectl logs \
  -l 'app.kubernetes.io/instance=actions-runner-controller' \
  -f
```

#### TBD

```log
2023-01-28T20:53:45Z    ERROR   runner  Failed to get new registration token    {"runner": "k8s-runners-7xfdj-bf9jx", "error": "failed to create registration token: POST https://api.github.com/orgs/<owner>/actions/runners/registration-token: 403 Resource not accessible by integration []"}
```

TODO

<!--
https://github.com/organizations/<owner>/settings/installations
-->

### Delete

```sh
helm uninstall actions-runner-controller \
  -n gar-system

kubectl delete ns gar-system \
  --grace-period=0 \
  --force
```
