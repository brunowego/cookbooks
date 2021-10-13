# Kubernetes ExternalDNS

## References

- [Frequently asked questions](https://github.com/kubernetes-incubator/external-dns/blob/master/docs/faq.md#user-content-are-other-ingress-controllers-supported)
- [Tutorials](https://github.com/kubernetes-incubator/external-dns/tree/master/docs/tutorials)

## Guides

- [Setting up ExternalDNS for Services on AWS](https://github.com/kubernetes-sigs/external-dns/blob/master/docs/tutorials/aws.md)

## Helm

### References

- [Parameters](https://github.com/bitnami/charts/tree/master/bitnami/external-dns#parameters)

### Repository

```sh
helm repo add bitnami 'https://charts.bitnami.com/bitnami'
helm repo update
```

### Dependencies

**For CoreDNS Provider**

- [etcd (Bitnami)](/etcd.md) or [etcd Operator](/etcd-operator.md)
- [CoreDNS](/coredns.md)

### Install

```sh
helm install external-dns bitnami/external-dns \
  --namespace kube-system \
  --version 5.2.1 \
  -f <(cat << EOF
provider: coredns

coredns:
  etcdEndpoints: http://etcd-cluster.kube-system.svc.cluster.local:2379
EOF
)
```

### Status

```sh
kubectl rollout status deploy/external-dns \
  -n kube-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=external-dns' \
  -n kube-system \
  -f
```

### Test

#### Running

```sh
kubectl run nginx \
  --generator=run-pod/v1 \
  --image=nginx:latest \
  --replicas=1 \
  --port=80

kubectl expose pod/nginx \
  --port=80 \
  --target-port=80 \
  --type=LoadBalancer
```

#### Annotations

```sh
kubectl annotate service nginx 'external-dns.alpha.kubernetes.io/hostname=nginx.example.com.'
kubectl annotate service nginx 'external-dns.alpha.kubernetes.io/ttl=10'
```

```sh
kubectl get service nginx -o yaml
```

#### DNS

```sh
dig @10.96.0.10 nginx.example.com +short

nslookup nginx.example.com 10.96.0.10
```

#### Delete

```sh
kubectl delete service/nginx
kubectl delete pod/nginx
```

### Tips

<!-- ####

Identity and Access Management (IAM) -> Policies -> external-dns

```sh
#
cat << EOF > ./external-dns.json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "route53:ChangeResourceRecordSets",
        "sts:AssumeRole"
      ],
      "Resource": [
        "arn:aws:route53::*:hostedzone/*",
        "arn:aws:iam::[account-id]:role/external-dns"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "route53:ListHostedZones",
        "route53:ListResourceRecordSets",
        "route53:ListHostedZonesByName"
      ],
      "Resource": [
        "*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": "route53:GetChange",
      "Resource": "arn:aws:route53:::change/*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "route53:ChangeResourceRecordSets",
        "route53:ListResourceRecordSets"
      ],
      "Resource": "arn:aws:route53:::hostedzone/*"
    },
    {
      "Effect": "Allow",
      "Action": "route53:ListHostedZonesByName",
      "Resource": "*"
    }
  ]
}
EOF

#
cat << EOF > ./external-dns.json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "route53:ChangeResourceRecordSets"
      ],
      "Resource": [
        "arn:aws:route53:::hostedzone/*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "route53:ListHostedZones",
        "route53:ListResourceRecordSets"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}
EOF
``` -->

#### Annotations

- [Are other Ingress Controllers supported?](https://github.com/kubernetes-incubator/external-dns/blob/master/docs/faq.md#user-content-are-other-ingress-controllers-supported)

```sh
kubectl annotate ingress myapp 'external-dns.alpha.kubernetes.io/target=myapp.example.com' -n kube-monitor
kubectl annotate ingress myapp 'external-dns.alpha.kubernetes.io/ttl=10' -n kube-monitor
```

### Issues

#### Wrong Endpoint

```log
time="2019-09-18T13:53:03Z" level=error msg="context deadline exceeded"
```

Wrong etcd endpoints are configured.

```sh
helm get values external-dns | \
  yq r - coredns.etcdEndpoints
```

### Delete

```sh
helm uninstall external-dns \
  -n external-dns
```

<!--
service.beta.kubernetes.io/aws-load-balancer-type: "nlb"
service.beta.kubernetes.io/aws-load-balancer-internal: "true"
service.beta.kubernetes.io/aws-load-balancer-internal: 10.96.0.0/11
service.beta.kubernetes.io/aws-load-balancer-proxy-protocol: "*"
service.beta.kubernetes.io/aws-load-balancer-ssl-cert: arn:aws:acm:us-east-1:[id]:certificate/[uuid]
service.beta.kubernetes.io/aws-load-balancer-ssl-ports: https
service.beta.kubernetes.io/aws-load-balancer-cross-zone-load-balancing-enabled: "true"
-->
