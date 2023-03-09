# Kubernetes Scaffold

TODO

<!--
secretGenerator:
  - name: secrets
    envs:
      - .secrets
-->

<!--
secretGenerator:
  - name: ghcr-auth
    type: kubernetes.io/dockerconfigjson
    files:
      - .dockerconfigjson=ghcr.dockerconfigjson.encrypted
-->

<!--
.k8s/overlays/internal/kustomization.yml

patches:
  - path: patches/ingress_patch.yml
    target:
      group: networking.k8s.io
      version: v1
      kind: Ingress
      name: web

.k8s/overlays/internal/patches/ingress_patch.yml

---
- op: add
  path: /metadata/annotations/cert-manager.io~1cluster-issuer
  value: letsencrypt-issuer
- op: replace
  path: /spec/ingressClassName
  value: external-nginx
- op: replace
  path: /spec/rules/0/host
  value: storybook.domain.tld
- op: add
  path: /spec/tls/0/hosts/0
  value: storybook.domain.tld
- op: add
  path: /spec/tls/0/secretName
  value: storybook.tls-secret
-->
