# Kubernetes TLS Secret

## Dependencies

- [OpenSSL](/openssl.md#generate)

## Create

### Automatic

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n [namespace]
```

### Manualy

```sh
cat << EOF | kubectl create -f -
apiVersion: v1
kind: Secret
metadata:
  name: example.tls-secret
  namespace: [namespace]
type: kubernetes.io/tls
data:
  tls.crt: $(cat /etc/ssl/certs/example/root-ca.crt | base64)
  tls.key: $(cat /etc/ssl/private/example/root-ca.key | base64)
EOF
```

## Show

```sh
kubectl get secret example.tls-secret -o yaml -n [namespace]
```

## Delete

```sh
kubectl delete secret example.tls-secret -n [namespace]
```
