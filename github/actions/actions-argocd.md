# Actions Argo CD

## Guides

- [Kustomize](https://argoproj.github.io/argo-cd/user-guide/kustomize/)
- [Helm](https://argoproj.github.io/argo-cd/user-guide/helm/)

## Workflows

TODO

<!-- ### Using Kubernetes Manifests

```yaml
name: GitOps

on:
  push:
    branches:
    - main

jobs:
  sync-apps:
    runs-on: ubuntu-latest
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
``` -->

<!-- ### Using Helm

```yaml
name: GitOps

on:
  push:
    branches:
    - main

jobs:
  sync-apps:
    runs-on: ubuntu-latest
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
