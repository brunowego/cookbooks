# Log Generator

## Helm

### Repository

```sh
helm repo add banzaicloud-stable 'https://kubernetes-charts.banzaicloud.com'
helm repo update
```

### Install

```sh
#
helm show values banzaicloud-stable/log-generator

#
kubectl create ns my-app

#
helm upgrade log-generator banzaicloud-stable/log-generator \
  --namespace my-app \
  -f <(cat << EOF
image:
  repository: 033498657557.dkr.ecr.us-east-2.amazonaws.com/banzaicloud/log-generator
  tag: 0.3.6
EOF
)
```

### Status

```sh
kubectl rollout status deploy/log-generator \
  -n my-app
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=log-generator' \
  -n my-app \
  -f
```

### Testing

```sh
#
kubens my-app

#
kubectl get clusteroutput loki-output \
  -n logging-system

#
kubectl get pods -l 'app.kubernetes.io/name=log-generator,app.kubernetes.io/instance=log-generator'

#
cat << \EOF | kubectl apply \
  -f -
apiVersion: logging.banzaicloud.io/v1beta1
kind: Flow
metadata:
  name: log-generator-flow
spec:
  globalOutputRefs:
  - loki-output
  filters:
  - tag_normaliser:
      format: ${namespace_name}.${pod_name}.${container_name}
  - parser:
      remove_key_name_field: true
      reserve_data: true
      parse:
        type: nginx
  # - stdout:
  #     output_type: json
  match:
  - select:
      labels:
        app.kubernetes.io/name: log-generator
        app.kubernetes.io/instance: log-generator
EOF

#
kubectl get flow
```

### Issues

#### Failed to Pull Image

```log
Warning  Failed          1s (x2 over 19s)   kubelet            Failed to pull image "[id].dkr.ecr.us-east-2.amazonaws.com/banzaicloud/log-generator:0.3.7": rpc error: code = Unknown desc = Error response from daemon: pull access denied for [id].dkr.ecr.us-east-2.amazonaws.com/banzaicloud/log-generator, repository does not exist or may require 'docker login': denied: User: arn:aws:sts::[id]:assumed-role/nodes.[...].k8s.local/i-[id] is not authorized to perform: ecr:BatchGetImage on resource: arn:aws:ecr:us-east-2:[id]:repository/banzaicloud/log-generator
Warning  Failed          1s (x2 over 19s)   kubelet            Error: ErrImagePull
```

Try Docker login with [AWS Elastic Container Registry (ECR)](/aws/aws-ecr.md#usage)

### Delete

```sh
helm uninstall log-generator \
  -n my-app

kubectl delete ns my-app \
  --grace-period=0 \
  --force
```
