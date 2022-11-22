# Backstage

<!--
TODO NEXT
-->

**Keywords:** Developer Portal, Software Catalog

## Links

- [Code Repository](https://github.com/backstage/backstage)
- [Main Website](https://backstage.io/)
- [Demo](https://demo.backstage.io/)

## Glossary

- Internal Developer Platform (IDP)

## References

- [Getting started with Backstage](https://github.com/spotify/backstage/blob/master/docs/getting-started/README.md)

## Helm

**WIP:** Currently not working as expected.

### References

- [Values](https://github.com/deliveryhero/helm-charts/tree/master/stable/backstage#values)

### Repository

```sh
helm repo add deliveryhero 'https://charts.deliveryhero.io'
helm repo update
```

### Install

```sh
#
kubectl create ns backstage-system

#
helm search repo -l deliveryhero/backstage

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install backstage deliveryhero/backstage \
  --namespace backstage-system \
  --version 0.1.12 \
  -f <(cat << EOF
ingress:
  ingressClassName: nginx

database:
  create: true

appConfig:
  app:
    baseUrl: http://backstage.${DOMAIN}
    title: Backstage
  backend:
    baseUrl: http://backstage.${DOMAIN}
    cors:
      origin: http://backstage.${DOMAIN}
  lighthouse:
    baseUrl: http://backstage.${DOMAIN}/lighthouse-api
  techdocs:
    storageUrl: http://backstage.${DOMAIN}/api/techdocs/static/docs
    requestUrl: http://backstage.${DOMAIN}/api/techdocs
EOF
)

#
kubectl get all -n backstage-system
```

<!--
kubectl port-forward \
  --address 0.0.0.0 \
  -n backstage-system \
  svc/backstage-backend \
  8080:80
-->

### Status

```sh
kubectl rollout status deploy/backstage-backend \
  -n backstage-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=backstage' \
  -n backstage-system \
  -f
```

<!-- ### Issues -->

<!-- ####

```log
Error: INSTALLATION FAILED: unable to build kubernetes objects from release manifest: [resource mapping not found for name: "backstage-ingress" namespace: "" from "": no matches for kind "Ingress" in version "networking.k8s.io/v1beta1"
ensure CRDs are installed first, resource mapping not found for name: "backstage-ingress-lighthouse" namespace: "" from "": no matches for kind "Ingress" in version "networking.k8s.io/v1beta1"
ensure CRDs are installed first]
```

{{- if .Values.ingress.ingressClassName }}
ingressClassName: {{ .Values.ingress.ingressClassName }}
{{- end }}
-->

### Delete

```sh
helm uninstall backstage \
  -n backstage-system

kubectl delete ns backstage-system \
  --grace-period=0 \
  --force
```
