# Docker Registry

## Pricing

- [Amazon](https://aws.amazon.com/ecr/pricing)
- [DigitalOcean](https://digitalocean.com/pricing/container-registry)
- [GitHub](https://docs.github.com/en/billing/managing-billing-for-github-packages/about-billing-for-github-packages)

<!--
https://medium.com/@harsh.manvar111/container-registries-comparison-6af23cfa225a
-->

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/docker-registry#configuration)

### Install

```sh
kubectl create ns docker-registry
```

```sh
helm install docker-registry stable/docker-registry \
  --namespace docker-registry \
  --set ingress.enabled=true \
  --set ingress.hosts={registry.${K8S_DOMAIN}}
```

### SSL

### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls docker-registry.tls-secret \
  --cert='/etc/ssl/certs/docker-registry/root-ca.crt' \
  --key='/etc/ssl/private/docker-registry/root-ca.key' \
  -n docker-registry
```

```sh
helm upgrade docker-registry stable/docker-registry -f <(yq m <(cat << EOF
ingress:
  tls:
    - secretName: docker-registry.tls-secret
      hosts:
        - registry.${K8S_DOMAIN}
EOF
) <(helm get values docker-registry))
```

#### Remove

```sh
helm upgrade docker-registry stable/docker-registry -f <(yq d <(helm get values docker-registry) ingress.tls)

kubectl delete secret docker-registry.tls-secret -n docker-registry
```

### Status

```sh
kubectl rollout status deploy/docker-registry -n docker-registry
```

### Logs

```sh
kubectl logs -l 'app=docker-registry' -n docker-registry -f
```

### DNS

```sh
dig @10.96.0.10 docker-registry.docker-registry.svc.cluster.local +short
nslookup docker-registry.docker-registry.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 registry.${K8S_DOMAIN} +short
nslookup registry.${K8S_DOMAIN} 10.96.0.10
```

### Secret

```sh
kubectl get secret docker-registry-secret \
  -o jsonpath='{.data.haSharedSecret}' \
  -n docker-registry | \
    base64 -d; echo
```

### Delete

```sh
helm uninstall docker-registry -n docker-registry
kubectl delete ns docker-registry --grace-period=0 --force
```

## Docker

### Local Persist

```sh
docker volume create \
  $(echo "$DOCKER_RUN_OPTS") \
  -d local-persist \
  -o mountpoint=/data/docker.io \
  --name=docker-registry-data
```

```sh
docker volume inspect docker-registry-data
```

<!--
#### Local NFS

```sh
docker volume create \
  --driver local \
  --opt type=nfs \
  --opt o=nfsvers=3,addr=$(ip route get 1 | awk '{print $NF;exit}'),rw \
  --opt device=:$HOME/Example \
  docker-registry-data
```

```sh
sudo tee -a /etc/exports <<< "/Volumes/NAS -alldirs -mapall=$(id -u):$(id -g) localhost"
sudo tee -a /etc/exports <<< "/Volumes/NAS *(rw,sync,all_squash,anonuid=0,anongid=0)"
sudo tee -a /etc/exports <<< "/Volumes/NAS *(rw,sync,no_root_squash,insecure)"
```

```sh
# Darwin
sudo nfsd restart

# Linux
sudo systemctl restart nfs
```

```sh
docker volume inspect docker-registry-data
``` -->

### Running

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h registry \
  -v docker-registry-data:/var/lib/registry \
  -v docker-registry-config:/etc/docker/registry \
  -p 5000:5000 \
  --name docker-registry \
  docker.io/library/registry:2
```

<!-- ```sh
#
docker exec docker-registry cat /etc/docker/registry/config.yml | \
  yq w - proxy.remoteurl 'https://registry-1.docker.io' | \
    docker exec -i docker-registry /bin/sh -c 'cat > /etc/docker/registry/config.yml'

#
docker restart docker-registry
``` -->

### Logs

```sh
docker logs -f docker-registry
```

### Test

```sh
time docker pull docker.io/library/redis:latest
```

```sh
# kind
curl -X GET "http://127.0.0.1:5000/v2/_catalog"

# minikube
curl -X GET "http://$(minikube ip):5000/v2/_catalog"

# Docker Machine
curl -X GET "http://127.0.0.1:5000/v2/_catalog"
```

```sh
docker rmi docker.io/library/redis:latest
```

```sh
time docker pull docker.io/library/redis:latest
```

### Remove

```sh
docker rm -f docker-registry

docker volume rm \
  docker-registry-data \
  docker-registry-config
```
