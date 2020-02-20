# Sonatype Nexus

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/sonatype-nexus#configuration)

### Dependencies

- [NGINX Ingress](/nginx-ingress.md)
- storage-provisioner or [NFS Client Provisioner](/nfs-client-provisioner.md)

### Install

```sh
kubectl create namespace sonatype-nexus
```

```sh
helm install stable/sonatype-nexus \
  -n sonatype-nexus \
  --namespace sonatype-nexus \
  --set statefulset.enabled=true \
  --set nexus.service.type='ClusterIP' \
  --set nexusProxy.env.nexusDockerHost="registry.$(minikube ip).nip.io" \
  --set nexusProxy.env.nexusHttpHost="nexus.$(minikube ip).nip.io" \
  --set ingress.enabled=true \
  --set ingress.annotations."kubernetes\.io/ingress\.class"=nginx \
  --set ingress.annotations."nginx\.ingress\.kubernetes\.io/proxy-body-size"=0 \
  --set ingress.tls.enabled=false
```

### SSL

#### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n sonatype-nexus
```

```sh
helm upgrade sonatype-nexus stable/sonatype-nexus -f <(yq m <(cat << EOF
ingress:
  tls:
    enabled: true
    secretName: example.tls-secret
EOF
) <(helm get values sonatype-nexus))
```

#### Remove

```sh
helm upgrade sonatype-nexus stable/sonatype-nexus -f <(yq d <(helm get values sonatype-nexus) ingress.tls)

kubectl delete secret example.tls-secret -n sonatype-nexus
```

### Status

```sh
kubectl rollout status statefulset/sonatype-nexus -n sonatype-nexus
```

### Logs

```sh
kubectl logs sonatype-nexus-0 nexus-proxy -n sonatype-nexus -f
kubectl logs sonatype-nexus-0 nexus -n sonatype-nexus -f
```

### DNS

```sh
dig @10.96.0.10 sonatype-nexus.sonatype-nexus.svc.cluster.local +short
nslookup sonatype-nexus.sonatype-nexus.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 "nexus.$(minikube ip).nip.io" +short
nslookup "nexus.$(minikube ip).nip.io" 10.96.0.10

dig @10.96.0.10 "registry.$(minikube ip).nip.io" +short
nslookup "registry.$(minikube ip).nip.io" 10.96.0.10
```

### Secret

```sh
kubectl exec -it \
  sonatype-nexus-0 \
  -c nexus \
  -n sonatype-nexus \
  -- cat /nexus-data/admin.password; echo
```

### Test

```sh
kubectl create secret docker-registry nxrm-oss-regcred \
  --docker-server='https://registry.$(minikube ip).nip.io' \
  --docker-username='admin' \
  --docker-password='[password]' \
  --docker-email='admin@example.com' \
  -n default
```

```sh
kubectl get secret nxrm-oss-regcred \
  -o jsonpath='{.data.\.dockerconfigjson}' \
  -n default | \
    base64 --decode | jq
```

```sh
kubectl patch serviceaccount default -p '{"imagePullSecrets":[{"name":"nxrm-oss-regcred"}]}' -n default
```

```sh
docker login \
  -u admin \
  registry.$(minikube ip).nip.io
```

```sh
docker pull docker.io/library/alpine:3.9
docker tag docker.io/library/alpine:3.9 registry.$(minikube ip).nip.io/library/alpine:3.9
docker push registry.$(minikube ip).nip.io/library/alpine:3.9
```

### Issues

#### Available CPUs

```log
The host system is allocating a maximum of 1 cores to the application. A minimum of 4 is recommended.
```

```sh
helm upgrade sonatype-nexus stable/sonatype-nexus -f <(yq m <(cat << EOF
nexus:
  resources:
    requests:
      cpu: 1
      memory: 2Gi
EOF
) <(helm get values sonatype-nexus))
```

#### Server Misbehaving

```log
Error response from daemon: Get http://registry.$(minikube ip).nip.io/v2/: dial tcp: lookup registry.$(minikube ip).nip.io on [ip]:53: server misbehaving
```

<!-- ```sh
minikube ssh -- sudo cat /etc/hosts
```

```sh
minikube ssh -- "sudo /usr/bin/sh -c 'echo -e \"$(kubectl get service nginx-ingress-controller -o jsonpath='{.status.loadBalancer.ingress[0].ip}' -n nginx-ingress)\tregistry.$(minikube ip).nip.io\" >> /etc/hosts'"
``` -->

#### Repository Missing

```log
Error response from daemon: Get https://registry.$(minikube ip).nip.io/v2/: net/http: request canceled (Client.Timeout exceeded while awaiting headers)
```

Try create a [hosted docker repository](/sonatype-nexus.md#hosted).

#### Self Signed Certificate

```log
Get https://registry.$(minikube ip).nip.io/v2/: x509: certificate signed by unknown authority
```

Add address `registry.$(minikube ip).nip.io` to insecure registry in docker daemon.

### Delete

```sh
helm delete sonatype-nexus --purge
kubectl delete namespace sonatype-nexus --grace-period=0 --force
```

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h sonatype-nexus3 \
  -v sonatype-nexus3-data:/nexus-data \
  -p 8081:8081 \
  --name sonatype-nexus3 \
  docker.io/sonatype/nexus3:3.20.0
```

```sh
docker exec sonatype-nexus3 cat /nexus-data/admin.password; echo
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8081'
```

### Remove

```sh
docker rm -f sonatype-nexus3
docker volume rm sonatype-nexus3-data
```

## Docs

### Create User

1. Server administration and configuration
2. Security
3. Users
4. Create local user

### Create Repository

#### Docker Hosted

1. Server administration and configuration
2. Repositories
3. Create repository
4. docker (hosted)
   - Name: docker-hosted
   - HTTP: (Check) 5003
   - Create repository

#### Docker Proxy

1. Server administration and configuration
2. Repositories
3. Create repository
4. docker (proxy)
   - Name: docker.io-proxy
   - Remote storage: [https://registry-1.docker.io](https://registry-1.docker.io)
   - Create repository
