# ChartMuseum

## References

- [Monocular](/monocular.md)

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/chartmuseum#configuration)

### Dependencies

- [NGINX Ingress](/nginx-ingress.md)
- [Kubernetes TLS Secret](/k8s-tls-secret.md)
- storage-provisioner or [NFS Client Provisioner](/nfs-client-provisioner.md)

### Install

```sh
kubectl create ns chartmuseum
```

```sh
kubectl create secret tls chartmuseum.tls-secret \
  --cert='/etc/ssl/certs/chartmuseum/root-ca.crt' \
  --key='/etc/ssl/private/chartmuseum/root-ca.key' \
  -n chartmuseum
```

```sh
helm install chartmuseum stable/chartmuseum \
  --namespace chartmuseum \
  --set persistence.enabled=true \
  --set env.open.DISABLE_API=false \
  --set ingress.enabled=true \
  --set "ingress.hosts[0].name=chartmuseum.${DOMAIN}" \
  --set 'ingress.hosts[0].path=/' \
  --set 'ingress.hosts[0].tls=true' \
  --set 'ingress.hosts[0].tlsSecret=chartmuseum.tls-secret'
```

#### API

```sh
curl -ks https://chartmuseum.${DOMAIN}/index.yaml | yq r -
```

```sh
curl -ks https://chartmuseum.${DOMAIN}/api/charts | jq .
```

#### Repository

##### Local

```sh
helm repo add --ca-file /etc/ssl/certs/chartmuseum/root-ca.crt chartmuseum https://chartmuseum.${DOMAIN}
helm repo update
```

##### Remote

```sh
kubectl get secret chartmuseum.tls-secret \
  -o jsonpath='{.data.tls\.crt}' \
  -n chartmuseum | \
    base64 -d > ./ca.crt
```

```sh
helm repo add --ca-file ./ca.crt chartmuseum https://chartmuseum.${DOMAIN}
```

```sh
rm ./ca.crt
```

### Delete

```sh
helm uninstall chartmuseum -n chartmuseum
kubectl delete ns chartmuseum --grace-period=0 --force
```

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h chartmuseum \
  -e DEBUG=true \
  -e STORAGE=local \
  -e STORAGE_LOCAL_ROOTDIR=/charts \
  -v chartmuseum-data:/charts \
  -p 8080:8080 \
  --name chartmuseum \
  chartmuseum/chartmuseum:v0.9.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f chartmuseum
docker volume rm chartmuseum-data
```

## CLI

### Installation

#### Darwin

```sh
curl -L 'https://s3.amazonaws.com/chartmuseum/release/latest/bin/darwin/amd64/chartmuseum' -o /usr/local/bin/chartmuseum && chmod +x /usr/local/bin/chartmuseum
```

#### Linux

```sh
sudo curl -L 'https://s3.amazonaws.com/chartmuseum/release/latest/bin/linux/amd64/chartmuseum' -o /usr/local/bin/chartmuseum && sudo chmod +x /usr/local/bin/chartmuseum
```

### Commands

```sh
chartmuseum -h
```

#### Local Storage

```sh
chartmuseum \
  --debug \
  --port=8080 \
  --storage='local' \
  --storage-local-rootdir='./charts'
```
