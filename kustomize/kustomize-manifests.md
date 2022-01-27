# Kustomize Manifests

<!--
https://www.jetstack.io/blog/kustomize-cert-manager/
-->

## Custom Resource (CR)

```sh
#
mkdir -p ./.k8s/base

cat << EOF > ./.k8s/base/kustomization.yaml
---
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

resources:
- namespace.yaml
- deployment.yaml
- service.yaml
- ingress.yaml

configMapGenerator:
- name: metadata

vars:
- name: APP_ENV
  objref:
    kind: ConfigMap
    name: metadata
    apiVersion: v1
  fieldref:
    fieldpath: data.APP_ENV
- name: APP_HOST
  objref:
    kind: ConfigMap
    name: metadata
    apiVersion: v1
  fieldref:
    fieldpath: data.APP_HOST
EOF

#
mkdir -p ./.k8s/overlays/local

#
cat << EOF > ./.k8s/overlays/local/.env
APP_ENV=local
APP_HOST=my-app.127.0.0.1.nip.io
EOF

#
cat << EOF > ./.k8s/overlays/local/kustomization.yaml
---
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

commonLabels:
  io.my-org.app: my-app

namePrefix: my-app-
namespace: my-app

bases:
- ../../base

configMapGenerator:
- behavior: merge
  envs:
  - .env
  name: metadata
EOF
```

<!-- ##

```yaml
---
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

namespace: quay-enterprise

resources:
- quay-enterprise-ns.yaml
- quay-registry-quayregistry.yaml

vars:
- fieldref:
    fieldPath: data.generateName
  name: generateName
  objref:
    apiVersion: v1
    kind: ConfigMap
    name: tektoncd-install-parameters

configurations:
- kustomizeconfig.yaml
```

./kustomizeconfig.yaml

```yaml
---
varReference:
- kind: ExternalSecret
  path: spec/data[]/key
``` -->
