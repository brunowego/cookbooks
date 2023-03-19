# OpenProject

<!--
https://github.com/opf/openproject-deploy/tree/stable/12/kubernetes

https://github.com/ShubhamTatvamasi/openproject/blob/61421a20de93cb5f7d3670ab4d202b4b808da305/README.md
-->

## Links

- [Code Repository](https://github.com/opf/openproject)
- [Main Website](https://openproject.org)

<!--
https://openproject.org/docs/system-admin-guide/integrations/github-integration/

https://<org-name>.openproject.com/projects/
-->

## Helm

**WIP:** Currently not working as expected.

### Dependencies

- [Cert Manager (cert-manager)](/cert-manager/README.md#helm)

### References

- [Chart Repository](https://github.com/truecharts/charts/blob/master/charts/incubator/openproject)

### Repository

```sh
helm repo add truecharts 'https://charts.truecharts.org'
helm repo update
```

### Install

```sh
#
kubectl create ns openproject

#
kubens openproject

#
helm search repo -l truecharts/openproject

#
helm install openproject truecharts/openproject \
  --version 3.0.23 \
  -f <(cat << EOF
common:
  manifests:
    enabled: false

service:
  main:
    ports:
      main:
        port: 8080
        targetPort: 8080
EOF
)

#
kubectl get all
```

<!--
kubectl port-forward \
  --address 0.0.0.0 \
  svc/openproject \
  8080:8080
-->

### Status

```sh
kubectl rollout status deploy/openproject
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=openproject' \
  -f
```

### Ingress

```sh
#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
cat << EOF | kubectl apply \
  -f -
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: openproject
  labels:
    app: openproject
  annotations:
    app.kubernetes.io/name: openproject
    # cert-manager.io/cluster-issuer: letsencrypt-issuer
    cert-manager.io/cluster-issuer: selfsigned-issuer
    nginx.ingress.kubernetes.io/backend-protocol: HTTPS
spec:
  ingressClassName: nginx
  tls:
  - hosts:
      - openproject.${DOMAIN}
    secretName: openproject.tls-secret
  rules:
    - host: openproject.${DOMAIN}
      http:
        paths:
        - backend:
            service:
              name: openproject
              port:
                number: 8080
          path: /
          pathType: Prefix
EOF

#
curl -k "https://openproject.${DOMAIN}"
```

<!-- ### Issues

#### TBD

```log
curl: (35) error:1404B42E:SSL routines:ST_CONNECT:tlsv1 alert protocol version
```

```sh
#
curl --tlsv1.2 --verbose -k -L http://0.0.0.0:8080
``` -->

### Delete

```sh
helm uninstall openproject

kubectl delete ns openproject \
  --grace-period=0 \
  --force
```

<!--
kubectl delete ns metallb-system \
  --grace-period=0 \
  --force

kubectl delete ns cert-manager \
  --grace-period=0 \
  --force

kubectl delete ns prometheus-operator \
  --grace-period=0 \
  --force
-->

<!--
kubectl create deployment openproject --image=openproject/community:11
kubectl expose deployment openproject --port=80 --name=openproject

kubectl apply -f - << EOF
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: openproject
spec:
  tls:
    - hosts:
      - openproject.k8s.shubhamtatvamasi.com
      secretName: letsencrypt
  rules:
    - host: openproject.k8s.shubhamtatvamasi.com
      http:
        paths:
        - path: /
          backend:
            serviceName: openproject
            servicePort: 80
EOF
-->
