# Kubernetes Secrets

## Tips

### Container Registry

**Dependencies:** [Secrets OPerationS (SOPS)](/sops.md)

#### For GitHub Container Registry (GHCR)

<!--
#
export GITHUB_USERNAME='brunowego'
export GITHUB_TOKEN='<github-token>'

#
kubectl create secret docker-registry ghcr-auth \
  --docker-server='https://ghcr.io' \
  --docker-username="$GITHUB_USERNAME" \
  --docker-password="$GITHUB_TOKEN" \
  --dry-run='client' \
  -o json \
    | jq -r '.data.".dockerconfigjson"' | \
      base64 -d | \
        > ./ghcr.dockerconfigjson
-->

```sh
#
sops \
  -e \
  --input-type json \
  --output-type json \
  ./ghcr.dockerconfigjson \
    > ./ghcr.dockerconfigjson.encrypted
```

**Refer:** `./kustomization.yml`

```yml
---
kind: Kustomization

# ...

secretGenerator:
  - name: ghcr-auth
    type: kubernetes.io/dockerconfigjson
    files:
      - .dockerconfigjson=ghcr.dockerconfigjson.encrypted
```
