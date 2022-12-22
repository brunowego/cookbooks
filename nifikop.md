# NiFiKop

## References

- [Apache NiFi](/apache/nifi.md)

## Helm

### References

- [Configuration](https://github.com/Orange-OpenSource/nifikop/tree/master/helm/nifikop#configuration)

### Dependencies

- [cert-manager](/cert-manager.md)

### Repository

```sh
helm repo add bitnami 'https://charts.bitnami.com/bitnami'
helm repo add orange-incubator 'https://orange-kubernetes-charts-incubator.storage.googleapis.com'
helm repo update
```

### Install

```sh
kubectl create ns nifi
```

```sh
helm install nifikop-zk bitnami/zookeeper \
  --namespace nifi \
  --set resources.requests.memory=256Mi \
  --set resources.requests.cpu=250m \
  --set resources.limits.memory=256Mi \
  --set resources.limits.cpu=250m \
  --set networkPolicy.enabled=true \
  --set replicaCount=3 \
  --set namespaces={'nifi'}

helm install nifikop orange-incubator/nifikop \
  --replace \
  --namespace nifi \
  --version 0.5.3 \
  --set image.tag=v0.5.3-release \
  --set resources.requests.memory=256Mi \
  --set resources.requests.cpu=250m \
  --set resources.limits.memory=256Mi \
  --set resources.limits.cpu=250m \
  --set securityContext={} \
  --set namespaces={'nifi'}
```

### Status

```sh
kubectl get pod -l 'app.kubernetes.io/name=zookeeper' -n nifi
kubectl get pod -l 'release=nifikop' -n nifi
```

### Logs

```sh
kubectl logs -l 'app.kubernetes.io/name=zookeeper' -n nifi -f
kubectl logs -l 'app=nifikop' -n nifi -f
```

### TBD

```sh
cat << EOF | kubectl create -f -
apiVersion: nifi.orange.com/v1alpha1
kind: NifiCluster
metadata:
  name: simplenifi
  namespace: nifi
spec:
  service:
    headlessEnabled: true
  zkAddress: 'nifikop-zk-zookeeper:2181'
  zkPath: '/simplenifi'
  clusterImage: 'docker.io/apache/nifi:1.12.1'
  oneNifiNodePerNode: false
  nodeConfigGroups:
    default_group:
      isNode: true
      storageConfigs:
        - mountPath: '/opt/nifi/nifi-current/logs'
          name: logs
          pvcSpec:
            accessModes:
              - ReadWriteOnce
            storageClassName: 'standard'
            resources:
              requests:
                storage: 10Gi
      serviceAccountName: 'default'
      # resourcesRequirements:
      #   limits:
      #     cpu: 0.5
      #     memory: 2Gi
      #   requests:
      #     cpu: 0.5
      #     memory: 2Gi
  nodes:
    - id: 1
      nodeConfigGroup: 'default_group'
    - id: 2
      nodeConfigGroup: 'default_group'
  propagateLabels: true
  nifiClusterTaskSpec:
    retryDurationMinutes: 10
  listenersConfig:
    internalListeners:
      - type: 'http'
        name: 'http'
        containerPort: 8080
      - type: 'cluster'
        name: 'cluster'
        containerPort: 6007
      - type: 's2s'
        name: 's2s'
        containerPort: 10000
EOF
```

```sh
cat << EOF | kubectl apply -f -
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: nifi
  namespace: nifi
spec:
  rules:
  - host: nifi.${DOMAIN}
    http:
      paths:
      - backend:
          service:
            name: simplenifi-headless
            port:
              number: 8080
        path: /
        pathType: Prefix
EOF
```

### Delete

```sh
helm uninstall nifikop -n nifi

kubectl delete ns nifi --grace-period=0 --force
```
