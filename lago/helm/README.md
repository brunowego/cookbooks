# Helm

## Dependencies

- [Cert Manager](/cert-manager/README.md#helm)

## Running

```sh
#
kubectl create ns lago

#
kubens lago

#
helm install postgresql bitnami/postgresql \
  --version 12.1.3 \
  -f <(cat << EOF
auth:
  postgresPassword: postgres
  username: lago
  password: lago
  database: lago
EOF
)

#
kubectl apply \
  -f <(cat << EOF
apiVersion: v1
kind: Secret
metadata:
  name: lago
type: Opaque
data:
  db_url: "$(echo -n 'postgresql://lago:lago@postgresql:5432/lago' | base64)"
  sessions_secret_key_base: "$(echo -n 'cb95f00eaf23a3500288741f95e40d7ecfe93d923f205e1aeb38bebe1e05d19c485f06e8370f5cd5b4603647ac71c8aa5a10685e9626e3b6cb7547479c65fa6f' | base64)"
  lago_rsa_private_key: "$(echo -n 'LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFb2dJQkFBS0NBUUVBdU9KNkRab2tXQi91V1dUdGxLOFROY0ZiT09jZXF2ZUtnajBacHRzaTIvVmhyNXRHCndRVjcwQmp6Yk5kWUFXZEIyRUFNZi8yTjhoUHFkaUcxMEdjVk96M2tXU3R2dURFczh6NHVqMWdETUFHSXhUZFAKZjVCdjk1dnNFUDRuSndmUTNBVDlheE52SXh4MWxTKzM5dXB0MkV4T0h6bW1Fc0JrZ0xOT0Vzd3dqNWxNMUprMwpBR3dvY2M4bzMycWM2NGpGOEdrWWJ0S0xSZ3VuWVVlcnR0a1FzWmw2YWg0SFNFeERheWRwQzV5VEhYeTVrL3ZoCkllZEd2Wm1RQ3UvUXJVci9ZY1MrR3BxSzVnS3N3UzI4c1NkQ0wxRy9nZDBEcXpxTnR6cHc1V29WUkNXMVpnYnAKTXkyOUM0REM0cmkxSmYvb3dqeUhrL2tpUnd3N0I0MEJSZStaelFJREFRQUJBb0lCQUNPMlEyTXJPZ2YzcXYrRApla3kxQUozcWltZFVaVjBhMFp0VW1BYmQzejdqaUFuMmtWVXBiUUFHUWNidFZhZDN2WVU2NGU4N0Y5Y0J0OUUzCnM3bmNuNEpBODBHeUhUTlQ5RjNMemd5TU1KbHVRbS90dmlKaTBPM2dKVm9tN1lNaGhGdHJiMVBtZmhvbkhpTkMKQTJQalpuSllVdUsvTFBBRVQ2VjRmUVV1Z2RiS3JpdExqQnVOeTJHVmo3RHNlaFNTdkxCdFlkK0Y0U1pxb0ZFTQpBcUdiTjJYOC8zUFN5bzJtWUd6R3B6TG9KYWpNWENTSlh0dXE4S3pYMTI2azJSbjZmK0hsTStEM21uQm1DWjMzCmZBcVhNd25JNHMyaU5nSVBLNGVML0ltclVtalBEYUZrS0Yzc0F0QjUrdDhEZFZEenBnVncrWExsUGtrdERsdWMKWVV2QThkVUNnWUVBOUVFenJJR0xGRGxBZWYxUUJNaTdVY2lGSkIrU3d5N0JzRjF1ZFRrRGNpL2t2RjBhYWpEZQp1VDRXMHFSSHZ1WVNRWkRiSDVqVmgrcnVPSENEUG4rUGlhZHZ5bk1EbzlNTkV1aE81ampQMEI5SkhzbXFpWnBSCmNyZ3pNdmN0NW9WcGpGNU9ZUXpEclFvb2pQLzVvWkx2TmxXS0h0NElCYTBTZTljM0xOVWFKWU1DZ1lFQXdjWnMKcHJsOG5SUzVTWFRMNHg3MnczZFlJTWdHUmxERVBMV1VhK2haMExjMUc0dFhQMVJ3L3c5L1hrdGJOVG5uSkxKTwpzYk5DRWlVbHcrZ1M2STIzczRWSktwM2ZidmlVU2VnT1FvOHJFR2cvTjZiWWcxS1hLODZhdytuVVVSOEJtS3ZLCjI4b3cyNDdKYVJjRC9TMzQ2bUVSbytmRzV6UnpTNHFpbmhsM2NtOENnWUIxcGo1TWxpMDJkWWt2K1NxazAwY2UKMG5ZRyswcEd4MnUyRnByUXpjQnlMTTJCU1ZzaTBSMUducmlCaDIyamJ0QldVbjZwVG9WenJWNUhRektFVlE3LwpYKzRCMXJwbkc0NU5rQ1lJMEU2UTBiRDNxbTJCVUJweEpuWkswektCdWJzb1NIaDZXSnFiNjZ1eWxzMVgzUjFwCnozUHpBRUZlOG9sWHEwZEJTZmdKSHdLQmdCNlg0RkdXV1dsSGUxVnduandXaUdrbDc0RUZjNUFvY2tNUGZBWnAKWWJ6RklCcGdMbjh1S3NUcVFuYTF1UW0zUVpvV21Md1BqQy9uTTRZeG5zS2VsVkUvaXVTeWxqTWtCZTJCT0xjagplVzRXdDF4bStDb0xvUmhtZnlMTlNSc2hwUlBnazUrTjFaYmtmVUlkUXlEMjRDVEkvSXIvTGZVVTM5c2VZVHhLCjB3UDdBb0dBWFdoVjNkQWcxMzVNUVl2elkxeTBNLzFsdTY2WTZTRzNEdU5pS2dSMEtQTFlleUFabzZtWFNQa3AKR1IyN2QrdGlrb0o0V09ocThqNmNVbnA1aXhRVUhtKzVnb0JxUXlQK1EzTnJlTlFWQ1psamoyenZvYUxHdkhLSAozOWhRdTF3TmxaMVNUR0pSYWtHQ3R3cHFZNXVaOFcyK0I3S00vakxIS3ZNbXRMcW5xd3M9Ci0tLS0tRU5EIFJTQSBQUklWQVRFIEtFWS0tLS0tCg==' | base64)"
  encryption_primary_key: "$(echo -n 'S3cr3t_K#Key' | base64)"
  encryption_deterministic_key: "$(echo -n 'S3cr3t_K#Key' | base64)"
  encryption_key_derivation_salt: "$(echo -n 'S3cr3t_K#Key' | base64)"
EOF
)

#
kubectl get secret lago \
  -o json | \
    jq '.data | map_values(@base64d)'

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install lago ./ \
  -f <(cat << EOF
redis:
  enabled: true

hostname: lago.${DOMAIN}
EOF
)

#
kubectl logs \
  -l 'app=lago-worker' \
  -f

#
kubectl port-forward \
  --address 0.0.0.0 \
  svc/lago-front-svc \
  8080:80

#
kubectl port-forward \
  --address 0.0.0.0 \
  svc/lago-api-svc \
  3000:3000
```
