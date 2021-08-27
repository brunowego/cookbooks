# Kustomize Manifests

TODO

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
