# Production

## Cluster Issuer

```sh
#
cat << EOF | kubectl apply \
  -n cert-system \
  -f -
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-issuer # or letsencrypt-prod
spec:
  acme:
    # server: https://acme-staging-v02.api.letsencrypt.org/directory
    server: https://acme-v02.api.letsencrypt.org/directory
    email: devops@xyz.tld
    privateKeySecretRef:
      name: letsencrypt-issuer
    solvers:
      - http01:
          ingress:
            class: external-nginx
      - selector:
          dnsZones:
            - <domain.com>
        dns01:
          route53:
            region: eu-east-1
            accessKeyID: <access-key-id>
            secretAccessKeySecretRef:
              name: cert-manager-aws-route53
              key: AWS_SECRET_ACCESS_KEY
EOF

#
kubectl get clusterissuer -o wide

#
kubectl describe clusterissuer letsencrypt-issuer
```

<!-- ## Route 53

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
