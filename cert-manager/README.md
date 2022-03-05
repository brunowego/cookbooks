# cert-manager

<!--
kubectl patch ingress/mobilecapture-mobile-capture -p '{"metadata":{"annotations":{"cert-manager.io/issuer":"letsencrypt-prod"}}}'

https://github.com/Thakurvaibhav/k8s/tree/master/cert-manager

https://github.com/kubernetes-up-and-running/kuard
-->

## Links

- [Code Repository](https://github.com/jetstack/cert-manager)
- [Main Website](https://cert-manager.io/)

## Guides

- [Securing NGINX-ingress](https://cert-manager.io/docs/tutorials/acme/ingress/)
- [Troubleshooting Issuing ACME Certificates](https://cert-manager.io/docs/faq/acme/)

## Certificate Authority

- [Let's Encrypt](/letsencrypt.md)

## kubectl (CLI)

### Guides

- [Kubectl plugin](https://cert-manager.io/next-docs/usage/kubectl-plugin/)

### Installation

```sh
kubectl krew install cert-manager
```

### Commands

```sh
kubectl cert-manager help
```

### Usage

```sh
#
kubens [ns-name]

#
kubectl cert-manager check api

#
kubectl get certificates -o wide

#
kubectl cert-manager status certificate [cert-name]

#
kubectl get certificaterequest

#
kubectl delete certificaterequest [cert-req-id]

#
kubectl get certificates -o wide

#
kubectl cert-manager renew [cert-name]

#
kubectl get certificaterequest

#
kubectl describe certificaterequest [cert-req-id]
```

## Helm

### References

- [Helm Charts](https://github.com/jetstack/cert-manager/tree/master/deploy/charts/cert-manager)

### Dependencies

- [NGINX Ingress Controller](/kubernetes/ingress-controllers/ingress-nginx/README.md#helm)

### Repository

```sh
helm repo add jetstack 'https://charts.jetstack.io'
helm repo update
```

### Install

```sh
#
kubectl create ns cert-manager

#
helm install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --version v1.5.4 \
  -f <(cat << EOF
installCRDs: true

ingressShim:
  defaultIssuerKind: ClusterIssuer
  defaultIssuerName: letsencrypt-issuer

prometheus:
  enabled: false
EOF
)
```

### Status

```sh
kubectl rollout status deploy/cert-manager \
  -n cert-manager
```

### Cluster Issuer

```sh
#
cat << EOF | kubectl apply \
  -n cert-manager \
  -f -
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-issuer
spec:
  acme:
    server: https://acme-v02.api.letsencrypt.org/directory
    email: brunowego@gmail.com
    privateKeySecretRef:
      name: letsencrypt-issuer
    solvers:
    - http01:
        ingress:
          class: nginx
    # - selector:
    #     dnsZones:
    #     - domain.com
    #   dns01:
    #     route53:
    #       region: eu-east-1
    #       accessKeyID: [SECRET]
    #       secretAccessKeySecretRef:
    #         name: cert-manager-route53
    #         key: AWS_SECRET_ACCESS_KEY
EOF

#
kubectl get clusterissuer -o wide

#
kubectl describe clusterissuer letsencrypt-issuer
```

<!-- ####

Identity and Access Management (IAM) -> Users -> letsencrypt-issuer
Identity and Access Management (IAM) -> Policies -> letsencrypt-issuer

```sh
cat << EOF > ./letsencrypt-issuer.json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "route53:GetChange",
      "Resource": "arn:aws:route53:::change/*"
    },
    {
      "Effect": "Allow",
      "Action": "route53:ChangeResourceRecordSets",
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
``` -->

### Ingress

```sh
#
kubectl annotate ingress \
  [ingress-name] \
  cert-manager.io/cluster-issuer='letsencrypt-issuer'

kubectl annotate ingress \
  [ingress-name] \
  kubernetes.io/ingress.class='nginx'
```

<!--
letsencrypt-issuer
letsencrypt-wildcard
letsencrypt-staging
letsencrypt-prod
-->

### Tips

#### Certificates

```sh
#
kubectl get certificates -o wide

#
kubectl describe certificate [name]
```

#### Orders

```sh
#
kubectl get certificaterequests

#
kubectl get orders

#
kubectl describe order [name]
```

#### Challenges

```sh
#
kubectl get challenges

#
kubectl describe challenge [name]
```

### Issues

<!-- ####

```log
The certificate request has failed to complete and will be retried: Failed to wait for order resource "[name]" to become ready: order is in "invalid" state:
```

TODO -->

#### DNS Problem

```log
Error accepting authorization: acme: authorization error for [example.com]: 400 urn:ietf:params:acme:error:dns: During secondary validation: DNS problem: query timed out looking up TXT for _acme-challenge.[example.com]
```

```sh
#
kubectl get certificaterequests

#
kubectl delete certificaterequest [name]

#
kubectl get certificates -o wide

#
kubectl cert-manager renew [name]

#
kubectl cert-manager status certificate [name]
```

<!-- #### Rate Limit

```log
429 urn:ietf:params:acme:error:rateLimited: Error creating new order :: too many certificates already issued for: [domain]: see https://letsencrypt.org/docs/rate-limits/
```

TODO -->

### Delete

```sh
helm uninstall cert-manager \
  -n cert-manager

kubectl delete ns cert-manager \
  --grace-period=0 \
  --force
```
