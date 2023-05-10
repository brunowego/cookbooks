# Teleport Kube Agent

<!--
https://github.com/gravitational/teleport/tree/master/examples/chart
-->

## Helm

## Docs

- [Joining Services via Kubernetes ServiceAccount Token](https://goteleport.com/docs/management/join-services-to-your-cluster/kubernetes/)

<!--
https://goteleport.com/docs/management/join-services-to-your-cluster/join-token/
-->

### References

- [Chart Repository](https://github.com/gravitational/teleport/tree/master/examples/chart/teleport-kube-agent)

### Dependencies

- [Teleport](/teleport/README.md#helm)

### Install

```sh
#
kubens teleport

#
helm search repo -l teleport/teleport-kube-agent

#
cat << EOF | kubectl exec -i deployment/teleport-cluster-auth -- tctl create -f
---
kind: token
version: v2
metadata:
  name: kubernetes-token
  expires: '2050-01-01T00:00:00Z'
spec:
  roles: [App]
  join_method: kubernetes
  kubernetes:
    allow:
      # - service_account: <namespace>:teleport-app-service
      - service_account: teleport:teleport-app-service
EOF

#
kubectl exec -i deployment/teleport-cluster-auth tctl get token/kubernetes-token

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install teleport-app-service teleport/teleport-kube-agent \
  --version 13.0.0 \
  -f <(cat << EOF
proxyAddr: teleport.${DOMAIN}:443

roles: app

joinParams:
  method: kubernetes
  tokenName: kubernetes-token

# kubeClusterName: teleport.${DOMAIN}

apps:
  - name: grafana
    uri: http://grafana.grafana.svc.cluster.local:80

insecureSkipProxyTLSVerify: true
EOF
)

#
tsh login --proxy "teleport.${DOMAIN}" --user admin --insecure

#
tctl status --insecure

#
tsh apps ls --insecure
```

<!--
Problems? Try:

kubectl delete pod teleport-app-service-0
-->

### Logs

```sh
kubectl logs \
  -l 'app=teleport-app-service' \
  -f
```

### Next Step

- [Teleport Application Service](./services/application.md)

### Issues

#### TBD

```log
2023-05-09T22:20:26Z ERRO [PROC:1]    Instance failed to establish connection to cluster: kubernetes token user info did not match any allow rules. pid:7.1 service/connect.go:119
```

TODO
