# AWS Load Balancer Controller

## Links

- [Code Repository](https://github.com/kubernetes-sigs/aws-load-balancer-controller)
- [Main Website](https://kubernetes-sigs.github.io/aws-load-balancer-controller/)

## Guides

- [Ingress Annotations](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.1/guide/ingress/annotations/)

## Helm

### References

- [Helm Chart](https://github.com/kubernetes-sigs/aws-load-balancer-controller/tree/main/helm/aws-load-balancer-controller)

### Repository

```sh
helm repo add eks 'https://aws.github.io/eks-charts'
helm repo update
```

### Install

```sh
#
kubectl apply -k 'github.com/aws/eks-charts/stable/aws-load-balancer-controller//crds?ref=master'

#
export VPC_ID="$( \
aws ec2 describe-vpcs \
  --region us-east-1 \
  --filters Name=tag:Name,Values=Kubernetes \
  --query Vpcs[].VpcId | \
    grep -i vpc | \
      cut -f 1 \
)"

#
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  --namespace kube-system \
  --version 1.2.11 \
  -f <(cat << EOF
clusterName: develop.my-cluster.k8s.local

serviceAccount:
  create: false
  name: aws-load-balancer-controller

region: us-east-1

vpcId: $VPC_ID
EOF
)
```

<!--
https://github.com/awsdocs/amazon-eks-user-guide/blob/d2fc8ae4d9e913bcec253099e157ed73a96234a3/doc_source/aws-load-balancer-controller.md

eksctl utils associate-iam-oidc-provider --region eu-west-1 --cluster esleCluster --approve --profile ddmdavid

curl -o iam-policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.2.1/docs/install/iam_policy.json

aws iam create-policy --policy-name AWSLoadBalancerControllerIAMPolicy --policy-document file://iam-policy.json --profile ddmdavid

eksctl create iamserviceaccount --cluster=esleCluster --namespace=kube-system --name=aws-load-balancer-controller --attach-policy-arn=arn:aws:iam::130767921673:policy/AWSLoadBalancerControllerIAMPolicy --override-existing-serviceaccounts --approve --profile ddmdavid --region eu-west-1

helm repo add eks https://aws.github.io/eks-charts

kubectl apply -k "github.com/aws/eks-charts/stable/aws-load-balancer-controller//crds?ref=master"

helm install aws-load-balancer-controller eks/aws-load-balancer-controller -n kube-system --set clusterName=esleCluster --set serviceAccount.create=false --set serviceAccount.name=aws-load-balancer-controller
-->

<!-- ### Status

```sh
kubectl rollout status deploy/grafana \
  -n kube-system
``` -->

<!-- ### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=grafana' \
  -n kube-system \
  -f
``` -->

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
helm uninstall aws-load-balancer-controller \
  -n kube-system
```
