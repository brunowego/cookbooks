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

<!-- ## Issues -->

<!-- ####

```log
The certificate request has failed to complete and will be retried: Failed to wait for order resource "<name>" to become ready: order is in "invalid" state:
```

TODO -->
