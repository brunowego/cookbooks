# AWS Load Balancer Controller

## Links

- [Code Repository](https://github.com/kubernetes-sigs/aws-load-balancer-controller)
- [Main Website](https://kubernetes-sigs.github.io/aws-load-balancer-controller/)

## Guides

- [Ingress Annotations](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.1/guide/ingress/annotations/)

## Helm

### References

- [Configuration](https://github.com/kubernetes-sigs/aws-load-balancer-controller/tree/main/helm/aws-load-balancer-controller#configuration)

### Repository

```sh
helm repo add eks 'https://aws.github.io/eks-charts'
helm repo update
```

### Dependencies

- [eksctl](/eksctl.md)

#### Service Account

```sh
#
export AWS_EKS_CLUSTER_NAME='develop.my-cluster.k8s.local'

#
eksctl utils associate-iam-oidc-provider \
  --region us-east-1 \
  --cluster "$AWS_EKS_CLUSTER_NAME" \
  --approve

#
curl \
  -o /tmp/iam-policy.json \
  https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/main/docs/install/iam_policy.json

#
aws iam create-policy \
  --policy-name 'AWSLoadBalancerControllerIAMPolicy' \
  --policy-document file:///tmp/iam-policy.json

#
export AWS_ACCOUNT_ID="$(aws sts get-caller-identity --query Account --output text)"

#
eksctl create iamserviceaccount \
  --cluster "$AWS_EKS_CLUSTER_NAME" \
  --namespace kube-system \
  --name aws-load-balancer-controller \
  --role-name 'AmazonEKSLoadBalancerControllerRole' \
  --attach-policy-arn "arn:aws:iam::${AWS_ACCOUNT_ID}:policy/AWSLoadBalancerControllerIAMPolicy" \
  --override-existing-serviceaccounts \
  --approve

#
eksctl get iamserviceaccount \
  --cluster "$AWS_EKS_CLUSTER_NAME" \
  --name aws-load-balancer-controller \
  --namespace kube-system
```

### Install

<!--
https://github.com/awsdocs/amazon-eks-user-guide/blob/master/doc_source/aws-load-balancer-controller.md
-->

```sh
#
kubectl apply -k 'github.com/aws/eks-charts/stable/aws-load-balancer-controller//crds?ref=master'

#
export CLUSTER_NAME='develop.my-cluster.k8s.local'

#
export VPC_ID=''

#
helm search repo -l eks/aws-load-balancer-controller

#
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  --namespace kube-system \
  --version 1.4.6 \
  -f <(cat << EOF
clusterName: $CLUSTER_NAME

serviceAccount:
  create: false
  name: aws-load-balancer-controller

region: us-east-1

vpcId: $VPC_ID
EOF
)

#
kubectl get all -n kube-system
```

### Status

```sh
#
kubectl get serviceaccount aws-load-balancer-controller \
  -n kube-system

#
kubectl describe replicaset \
  -l app.kubernetes.io/instance=aws-load-balancer-controller \
  -n kube-system

#
kubectl rollout restart deployment aws-load-balancer-controller \
  -n kube-system

#
kubectl rollout status deploy/aws-load-balancer-controller \
  -n kube-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=aws-load-balancer-controller' \
  -n kube-system \
  -f
```

### Ingress

```sh
#
export K8S_INGRESS_NAME='my-app'
export AWS_WAF_ACL_ARN='arn:aws:wafv2:us-east-1:111111111111:regional/webacl/[name]/11111111-1111-1111-1111-111111111111'
export AWS_CERTIFICATE_ARN='arn:aws:acm:us-east-1:810141740403:certificate/044fb60c-16a5-49c1-abb0-d6e50bbc4988'
export AWS_CERTIFICATE_ARN='arn:aws:acm:us-east-1:111111111111:certificate/11111111-1111-1111-1111-111111111111'

#
cat << EOF | kubectl apply -f -
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: $K8S_INGRESS_NAME
  annotations:
    kubernetes.io/ingress.class: alb
    alb.ingress.kubernetes.io/actions.ssl-redirect: '{"Type":"redirect","RedirectConfig":{"Protocol":"HTTPS","Port":"443","StatusCode":"HTTP_301"}}'
    alb.ingress.kubernetes.io/certificate-arn: $AWS_CERTIFICATE_ARN
    alb.ingress.kubernetes.io/listen-ports: '[{"HTTP":80},{"HTTPS":443}]'
    alb.ingress.kubernetes.io/scheme: internet-facing
    alb.ingress.kubernetes.io/wafv2-acl-arn: $AWS_WAF_ACL_ARN
spec:
  rules:
  - host: my-app.example.com
    http:
      paths:
      - backend:
          service:
            name: ssl-redirect
            port:
              name: use-annotation
        path: /*
        pathType: ImplementationSpecific
      - backend:
          service:
            name: my-app
            port:
              name: http
        path: /*
        pathType: ImplementationSpecific
EOF

#
kubectl patch svc my-app -p '{"spec":{"type":"NodePort"}}' # or LoadBalancer
```

<!--
https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#LoadBalancers:sort=loadBalancerName
https://console.aws.amazon.com/wafv2/homev2/web-acls?region=us-east-1
-->

### Issues

#### TBD

```log
{"level":"error","ts":1673375095.3133678,"logger":"controller.service","msg":"Reconciler error","name":"ingress-controller-ingress-nginx-controller","namespace":"ingress-nginx","error":"TargetGroupNotFound: Target groups 'arn:aws:elasticloadbalancing:us-east-1:<account-id>:targetgroup/k8s-ingressn-ingressc-87ad2878ab/b3e57153d585bed4' not found\n\tstatus code: 400, request id: d71a12c7-a455-423f-bc30-b66de0265e1c"}
```

TODO

```sh
#
kubectl get targetgroupbinding -A
```

#### TBD

```log
Error: getting iamserviceaccounts: no output "Role1" in stack "eksctl-<cluster-name>-addon-iamserviceaccount-kube-system-aws-load-balancer-controller"
```

TODO

#### Missing Target Type

```log
{"level":"error","ts":1634591431.1706526,"logger":"controller","msg":"Reconciler error","controller":"ingress","name":"my-app","namespace":"my-ns","error":"InvalidParameter: 1 validation error(s) found.\n- minimum field value of 1, CreateTargetGroupInput.Port.\n"}
```

Change service to use `NodePort` instead of `ClusterIP`.

<!-- ####

```log
{"level":"error","ts":1634591702.9418764,"logger":"controller","msg":"Reconciler error","reconcilerGroup":"elbv2.k8s.aws","reconcilerKind":"TargetGroupBinding","controller":"targetGroupBinding","name":"k8s-my-app-0bea0a55b3","namespace":"my-app","error":"cannot resolve pod ENI for pods: [my-app/app-0 my-app/app-1 my-app/app-2]"}
```

TODO -->

### Delete

```sh
#
helm uninstall aws-load-balancer-controller \
  -n kube-system

#
eksctl delete iamserviceaccount \
  --cluster "$AWS_EKS_CLUSTER_NAME" \
  --namespace kube-system \
  --name aws-load-balancer-controller
```
