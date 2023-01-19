# AWS EKS IAC

<!--
https://antonputra.com/amazon/create-eks-cluster-using-terraform-modules/
-->

## Testing

```sh
#
export DOMAIN='domain.tld'

#
kubens '<nemaspace>'

#
cat << EOF | kubectl apply -f -
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: echoserver
spec:
  selector:
    matchLabels:
      app: echoserver
  replicas: 1
  template:
    metadata:
      labels:
        app: echoserver
    spec:
      containers:
        - image: k8s.gcr.io/e2e-test-images/echoserver:2.5
          name: echoserver
          ports:
            - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: echoserver
spec:
  ports:
    - port: 8080
      protocol: TCP
  type: ClusterIP
  selector:
    app: echoserver
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: echoserver
  annotations:
    alb.ingress.kubernetes.io/scheme: internet-facing
    alb.ingress.kubernetes.io/target-type: ip
spec:
  ingressClassName: alb
  rules:
    - host: echo.$DOMAIN
      http:
        paths:
          - path: /
            pathType: Exact
            backend:
              service:
                name: echoserver
                port:
                  number: 8080
EOF

#
kubectl logs \
  -l app=echoserver \
  -f

#
kubectl delete ingress,service,deployment echoserver
```

## Issues

### TBD

```log
error: You must be logged in to the server (Unauthorized)
```

```log
error: You must be logged in to the server (the server has asked for the client to provide credentials)
```

TODO

```sh
#
aws eks list-clusters --region us-east-1

#
eksctl get iamidentitymapping \
  -c '<name>' \
  -r us-east-1
```

### Wrong Values on State

```log
│ Error: Get "http://localhost/api/v1/namespaces/kube-system/configmaps/aws-auth": dial tcp [::1]:80: connect: connection refused
│
│   with module.eks.module.eks.kubernetes_config_map_v1_data.aws_auth[0],
│   on .terraform/modules/eks.eks/main.tf line 527, in resource "kubernetes_config_map_v1_data" "aws_auth":
│  527: resource "kubernetes_config_map_v1_data" "aws_auth" {
```

<!--
Add `create_aws_auth_configmap = true` to `module "eks"`.

https://github.com/terraform-aws-modules/terraform-aws-eks/issues/2007
-->

```sh
#
terraform state list

# For AWS
terraform state show 'module.eks.module.eks.aws_eks_cluster.this[0]'
terraform state rm 'module.eks.module.eks.kubernetes_config_map_v1_data.aws_auth[0]'

#
terraform state list | xargs -n 1 terraform state show
```

### TBD

```log
│ Error: error reading KMS Key (<UUID>): AccessDeniedException: User: arn:aws:iam::<account-id>:user/<email> is not authorized to perform: kms:DescribeKey on resource: arn:aws:kms:us-east-1:<account-id>:key/<UUID> because no resource-based policy allows the kms:DescribeKey action
```

TODO
