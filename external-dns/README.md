# ExternalDNS

## Links

- [Code Repository](https://github.com/kubernetes-sigs/external-dns)

## References

- [Frequently asked questions](https://github.com/kubernetes-incubator/external-dns/blob/master/docs/faq.md#user-content-are-other-ingress-controllers-supported)
- [Tutorials](https://github.com/kubernetes-incubator/external-dns/tree/master/docs/tutorials)

## Guides

- [Setting up ExternalDNS for Services on AWS](https://github.com/kubernetes-sigs/external-dns/blob/master/docs/tutorials/aws.md)

## Glossary

- Strict Transport Security (STS)
- Message Transfer Agent (MTA)

## Helm

### References

- [Configuration](https://github.com/kubernetes-sigs/external-dns/tree/master/charts/external-dns#configuration)

### Repository

```sh
helm repo add external-dns 'https://kubernetes-sigs.github.io/external-dns'
helm repo update
```

<!-- ### Dependencies

- [etcd (Bitnami)](/etcd.md) or [etcd Operator](/etcd-operator.md) -->

### Install

<!-- **Dependencies:** [CoreDNS](/coredns.md)

```sh
#
helm search repo -l external-dns/external-dns

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install external-dns bitnami/external-dns \
  --namespace kube-system \
  --version 1.12.0\
  -f <(cat << EOF
provider: coredns

coredns:
  etcdEndpoints: http://etcd-cluster.kube-system.svc.cluster.local:2379
EOF
)
``` -->

#### Cloudflare

<!--
https://github.com/kubernetes-sigs/external-dns/blob/master/docs/tutorials/cloudflare.md
-->

**Dependencies:** [Cloudflare](/cloudflare/README.md)

```sh
#
helm search repo -l external-dns/external-dns

#
export DOMAIN='domain.tld'
# export CF_API_TOKEN='<api-token>'
export CF_API_KEY='<api-key>'
export CF_API_EMAIL='<email>'

#
helm install external-dns external-dns/external-dns \
  --namespace kube-system \
  --version 1.12.0 \
  -f <(cat << EOF
env:
  # - name: CF_API_TOKEN
  #   value: $CF_API_TOKEN
  - name: CF_API_KEY
    value: $CF_API_KEY
  - name: CF_API_EMAIL
    value: $CF_API_EMAIL

domainFilters:
  - $DOMAIN

provider: cloudflare

extraArgs:
  - --cloudflare-proxied
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

<!--
https://tech.serhatteker.com/post/2021-08/kubernetes-ingress-ssl-dns-cloudflare/
-->

```sh
#
export DOMAIN='domain.tld'

#
cat << EOF | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
spec:
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - image: docker.io/library/nginx:latest
        name: nginx
        ports:
        - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: nginx
  annotations:
    external-dns.alpha.kubernetes.io/hostname: nginx.${DOMAIN}
    external-dns.alpha.kubernetes.io/ttl: '120'
spec:
  selector:
    app: nginx
  type: LoadBalancer
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
EOF

#
kubectl get service nginx -o yaml

#
kubectl delete service/nginx
kubectl delete deployment/nginx
```

<!--
kubectl annotate service nginx 'external-dns.alpha.kubernetes.io/cloudflare-proxied=true'
-->

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
#
kubens <namespace>

export DOMAIN='domain.tld'
export SUBDOMAIN='<subdomain>'
export INGRESS_NAME='<name>'

#
kubectl annotate ingress "$INGRESS_NAME" "external-dns.alpha.kubernetes.io/target=$SUBDOMAIN.$DOMAIN"
kubectl annotate ingress "$INGRESS_NAME" 'external-dns.alpha.kubernetes.io/ttl=120'
```

### Issues

#### TBD

```log
time="2023-01-17T01:53:33Z" level=error msg="Failure in zone domain.tld. [Id: /hostedzone/Z0452713392NDA7C5SB4P]"
time="2023-01-17T01:53:33Z" level=error msg="InvalidChangeBatch: [RRSet of type TXT with DNS name grafana.domain.tld. is not permitted because a conflicting RRSet of type CNAME with the same DNS name already exists in zone domain.tld., RRSet of type TXT with DNS name n8n.domain.tld. is not permitted because a conflicting RRSet of type CNAME with the same DNS name already exists in zone domain.tld.]\n\tstatus code: 400, request id: <UUID>"
time="2023-01-17T01:53:33Z" level=error msg="failed to submit all changes for the following zones: [/hostedzone/Z0452713392NDA7C5SB4P]"
```

TODO

#### Wrong Environment Variable

```log
time="2023-01-05T15:27:17Z" level=error msg="Invalid request headers (6003)"
```

**Related:** [Issue 342](https://github.com/kubernetes-sigs/external-dns/issues/342)

Instead of use `CF_API_KEY` change to `CF_API_TOKEN`.

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
