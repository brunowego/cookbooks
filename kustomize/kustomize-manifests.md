# Kustomize Manifests

<!--
https://www.jetstack.io/blog/kustomize-cert-manager/
-->

##

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
- name: my-app-metadata

vars:
- name: APP_ENV
  objref:
    kind: ConfigMap
    name: my-app-metadata
    apiVersion: v1
  fieldref:
    fieldpath: data.APP_ENV
- name: APP_HOST
  objref:
    kind: ConfigMap
    name: my-app-metadata
    apiVersion: v1
  fieldref:
    fieldpath: data.APP_HOST
EOF

#
mkdir -p ./.k8s/overlays/local

cat << EOF > ./.k8s/overlays/local/.env
APP_ENV=local
APP_HOST=my-app.127.0.0.1.nip.io
EOF

cat << EOF > ./.k8s/overlays/local/kustomization.yaml
---
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

commonLabels:
  io.arcotech.app: my-app

namePrefix: my-app-
namespace: my-app

bases:
- ../../base

configMapGenerator:
- behavior: merge
  envs:
  - .env
  name: my-app-metadata
EOF
```

<!-- ##

```yaml
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
nameReference:
- kind: Issuer
  group: cert-manager.io
  fieldSpecs:
  - kind: Certificate
    group: cert-manager.io
    path: spec/issuerRef/name

varReference:
- kind: Certificate
  group: cert-manager.io
  path: spec/commonName
``` -->
