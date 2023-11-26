# Config Map

TODO

<!--
configMapGenerator:
  - name: metadata
    literals:
      - INGRESS_HOST=acme.k8s.orb.local

replacements:
  - source:
      version: v1
      kind: ConfigMap
      name: metadata
      fieldPath: data.INGRESS_HOST
    targets:
      - select:
          kind: Ingress
          name: backend
        fieldPaths:
          - spec.rules.0.host
-->
