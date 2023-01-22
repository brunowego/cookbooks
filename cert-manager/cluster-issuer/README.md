# Cluster Issuer

## Solvers

- Let's Encrypt
  - [AWS Route 53](./letsencrypt/aws-route53.md)
- [Self Signed](./self-signed.md)

## Usage

```sh
# Certificates
kubectl get certificates -o wide
kubectl describe certificate <name>

# Orders
kubectl get certificaterequests
kubectl get orders
kubectl describe order <name>

# Challenges
kubectl get challenges
kubectl describe challenge <name>
```

## Issues

### TBD

```log
<namespace> cm-acme-http-solver-t9djk <none> grafana.domain.tld <name>.elb.us-east-1.amazonaws.com 80 9s
```

```sh
#
kubens <namespace>

#
kubectl get ingress

#
kubectl get certificates -o wide

#
kubectl cert-manager status certificate '<cert-name>'

#
kubectl get certificaterequest

#
kubectl delete certificaterequest '<cert-req-id>'

#
kubectl cert-manager renew '<cert-name>'

#
kubectl describe certificaterequest '<cert-req-id>'
```

<!-- ####

```log
The certificate request has failed to complete and will be retried: Failed to wait for order resource "<name>" to become ready: order is in "invalid" state:
```

TODO -->
