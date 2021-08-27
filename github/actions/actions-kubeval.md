# Actions Kubeval

## Workflow

```yaml
name: YAML Validator

on:
  push:
    branches:
    - main
    paths:
    - .github/**.yaml
    - k8s/**.yaml
  pull_request:
    paths:
    - .github/**.yaml
    - k8s/**.yaml

jobs:
  validation:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout Code
      uses: actions/checkout@v2

    - name: Validate YAML Manifests
      uses: stefanprodan/kube-tools@v1
      with:
        kustomize: 3.8.8
        kubeval: v0.16.1
        command: |
          echo 'Run kubeval'
          for ENV in `find ./k8s/overlays -type d | awk 'NR > 1'`; do
            kustomize build "$ENV" | \
              kubeval --skip-kinds 'ExternalSecret,EndpointMonitor'
          done

```
