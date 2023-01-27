# Actions Argo CD

<!--
OutOfSync -> Check HPA/Replicas
-->

## Links

- [Code Repository](https://github.com/clowdhaus/argo-cd-action)

## Guides

- [Kustomize](https://argoproj.github.io/argo-cd/user-guide/kustomize/)
- [Helm](https://argoproj.github.io/argo-cd/user-guide/helm/)

## Workflows

TODO

<!-- ### Using Kustomize

````yml
    - name: ArgoCD Overwrite Image Tag
      uses: clowdhaus/argo-cd-action/@main
      id: argocd_image_tag_overwrite
      with:
        command: app set dsb-messagebroker
        options: -p dsb-messagebroker.image.tag=${{needs.unique_id.outputs.unique_id}}
``` -->

<!-- ### Using Kubernetes Manifests

```yml
---
name: GitOps

on:
  push:
    branches:
    - main

jobs:
  sync-apps:
    runs-on: ubuntu-22.04
    steps:
    - name: Login to ArgoCD
      uses: clowdhaus/argo-cd-action/@main
      with:
        command: login 34.132.171.46
        options: --insecure --username admin --password dMQnvoJJrKwZbuHD

    - name: Sync apps
      uses: clowdhaus/argo-cd-action/@main
      with:
        command: app sync go-app
````

<!-- ### Using Helm

```yml
---
name: GitOps

on:
  push:
    branches:
    - main

jobs:
  sync-apps:
    runs-on: ubuntu-22.04
    steps:
    # ...

    - name: ArgoCD login
      uses: clowdhaus/argo-cd-action/@main
      id: argocd_login
      with:
        command: login ${{ secrets.ARGOCD_DEV_URL }}
        options: --insecure --password ${{ secrets.ARGOCD_DEV_PASS }} --username ${{ secrets.ARGOCD_DEV_USERNAME }}

    - name: ArgoCD overwrite values.yaml
      uses: clowdhaus/argo-cd-action/@main
      id: argocd_image_tag_overwrite
      with:
        command: app set dsb-messagebroker
        options: -p image.tag=${{needs.unique_id.outputs.unique_id}}
``` -->

<!--
./argocd app set applications -p image.tag=${GITHUB_SHA} -p releaseToggles=$releaseToggles --plaintext --grpc-web &&
./argocd app sync applications --plaintext --grpc-web &&
./argocd app sync -l app.kubernetes.io/instance=applications --plaintext --grpc-web
-->

<!-- ```sh
- name: Set up kubectl
  uses: azure/setup-kubectl@v1
  with:
    version: v1.22.1

- name: Set K8 Context
  uses: azure/k8s-set-context@v1
  with:
    kubeconfig: ${{ secrets.KUBE_CONFIG_STAGING }}
    context: <...>.k8s.local

- name: Kubectl Rollout Restart
  run: |
    kubectl config set-context --current --namespace my-app
    kubectl rollout restart deployment/my-app-web
    kubectl rollout restart deployment/my-app-worker
``` -->

### Issues

#### TBD

```log
Error: System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter ''using: node16' is not supported, use 'docker' or 'node12' instead.')
```

TODO
