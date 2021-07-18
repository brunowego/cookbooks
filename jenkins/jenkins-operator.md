# Jenkins Operator

## Helm

### References

- [Chart Repository](https://github.com/jenkinsci/kubernetes-operator/tree/master/chart/jenkins-operator)

### Repository

```sh
helm repo add jenkinsci 'https://raw.githubusercontent.com/jenkinsci/kubernetes-operator/master/chart'
helm repo update
```

### Install

```sh
#
kubectl create namespace jenkins-operator
```

```sh
helm install jenkins-operator jenkinsci/jenkins-operator \
  --namespace jenkins-operator  \
  --version 0.5.1 \
  -f <(cat << EOF
jenkins:
  enabled: false
EOF
)
```

### Status

```sh
kubectl rollout status deploy/logging-operator \
  -n jenkins-operator
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=logging-operator' \
  -n jenkins-operator  \
  -f
```

### Secrets

```sh
kubectl --namespace jenkins-operator get secret jenkins-operator-credentials-jenkins -o 'jsonpath={.data.user}' | base64 -d

kubectl --namespace jenkins-operator get secret jenkins-operator-credentials-jenkins -o 'jsonpath={.data.password}' | base64 -d
```

### Delete

```sh
helm uninstall logging-operator \
  -n jenkins-operator

kubectl delete namespace jenkins-operator  \
  --grace-period=0 \
  --force
```
