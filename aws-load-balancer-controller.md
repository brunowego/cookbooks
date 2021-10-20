# AWS Load Balancer Controller

## Links

- [Code Repository](https://github.com/kubernetes-sigs/aws-load-balancer-controller)
- [Main Website](https://kubernetes-sigs.github.io/aws-load-balancer-controller/)

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
export K8S_INGRESS_NAME=''
export AWS_WAF_ACL_ARN=''
export AWS_CERTIFICATE_ARN=''
```

#### Annotations

```sh
#
kubectl get ingress "$K8S_INGRESS_NAME" \
  -o jsonpath='{.metadata.annotations}' | \
    jq

#
kubectl annotate \
  --overwrite \
  ingress \
  "$K8S_INGRESS_NAME" \
  kubernetes.io/ingress.class='alb'

#
kubectl annotate \
  ingress \
  "$K8S_INGRESS_NAME" \
  alb.ingress.kubernetes.io/scheme='internet-facing'

#
kubectl annotate \
  ingress \
  "$K8S_INGRESS_NAME" \
  alb.ingress.kubernetes.io/target-type='ip'

#
kubectl annotate ingress \
  "$K8S_INGRESS_NAME" \
  alb.ingress.kubernetes.io/wafv2-acl-arn="$AWS_WAF_ACL_ARN"

#
kubectl annotate ingress \
  "$K8S_INGRESS_NAME" \
  alb.ingress.kubernetes.io/certificate-arn="$AWS_CERTIFICATE_ARN"

#
kubectl annotate ingress \
  "$K8S_INGRESS_NAME" \
  alb.ingress.kubernetes.io/success-codes='200'

#
kubectl annotate ingress \
  "$K8S_INGRESS_NAME" \
  alb.ingress.kubernetes.io/listen-ports='[{"HTTP":80},{"HTTPS":443}]'

#
kubectl annotate ingress \
  "$K8S_INGRESS_NAME" \
  alb.ingress.kubernetes.io/actions.ssl-redirect='{"Type":"redirect","RedirectConfig":{"Protocol":"HTTPS","Port":"443","StatusCode":"HTTP_301"}}'

#
kubectl annotate ingress \
  "$K8S_INGRESS_NAME" \
  alb.ingress.kubernetes.io/healthcheck-path='/api/v1/health-check'
```

<!--
# alb.ingress.kubernetes.io/target-type: instance
alb.ingress.kubernetes.io/group.name: external
# alb.ingress.kubernetes.io/group.name: default
alb.ingress.kubernetes.io/load-balancer-attributes: access_logs.s3.enabled=true,access_logs.s3.bucket=dop-eu-west-1-lb,access_logs.s3.prefix=sbx-k8s-ingress-external,routing.http.drop_invalid_header_fields.enabled=true
alb.ingress.kubernetes.io/subnets: sbx_igw_1_a, sbx_igw_1_b, sbx_igw_1_c
alb.ingress.kubernetes.io/group.name: external
alb.ingress.kubernetes.io/backend-protocol: HTTPS
alb.ingress.kubernetes.io/shield-advanced-protection: "true"
alb.ingress.kubernetes.io/actions.redirect-to-www: >
  {"Type": "redirect", "redirectConfig": {"Host":"www.guotiexin.com", "Port":"443", "Protocol":"HTTPS", "StatusCode":"HTTP_301"}}
alb.ingress.kubernetes.io/actions.only-allow-with-custom-header: >
  {"type": "forward", "forwardConfig": {"targetGroups": [{"serviceName": "wordpress", "servicePort": "http"}]}}
alb.ingress.kubernetes.io/conditions.only-allow-with-custom-header: >
  [{"field": "http-header", "httpHeaderConfig": {"httpHeaderName": "X-Custom-Header", "values": ["<your-secret-here>"]}}]
alb.ingress.kubernetes.io/tags: scos.delete.on.teardown=true
alb.ingress.kubernetes.io/ssl-policy: "ELBSecurityPolicy-TLS-1-2-2017-01"
-->

### Issues

#### Missing Target Type

```log
{"level":"error","ts":1634591431.1706526,"logger":"controller","msg":"Reconciler error","controller":"ingress","name":"my-app","namespace":"my-ns","error":"InvalidParameter: 1 validation error(s) found.\n- minimum field value of 1, CreateTargetGroupInput.Port.\n"}
```

```sh
#
kubectl annotate \
  ingress \
  "$K8S_INGRESS_NAME" \
  alb.ingress.kubernetes.io/target-type='ip'
```

####

```log
{"level":"error","ts":1634591702.9418764,"logger":"controller","msg":"Reconciler error","reconcilerGroup":"elbv2.k8s.aws","reconcilerKind":"TargetGroupBinding","controller":"targetGroupBinding","name":"k8s-my-app-0bea0a55b3","namespace":"my-app","error":"cannot resolve pod ENI for pods: [my-app/app-0 my-app/app-1 my-app/app-2]"}
```

TODO

### Delete

```sh
helm uninstall aws-load-balancer-controller \
  -n kube-system
```
