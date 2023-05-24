# Sonatype Nexus

<!--
https://repman.io/
-->

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/sonatype-nexus#configuration)

### Dependencies

- [NGINX Ingress](/nginx-ingress.md)
- storage-provisioner or [NFS Client Provisioner](/nfs-client-provisioner.md)

### Install

```sh
#
kubectl create ns sonatype-nexus

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install sonatype-nexus stable/sonatype-nexus \
  --namespace sonatype-nexus \
  --set statefulset.enabled=true \
  --set nexus.service.type='ClusterIP' \
  --set nexusProxy.env.nexusDockerHost="registry.${DOMAIN}" \
  --set nexusProxy.env.nexusHttpHost="nexus.${DOMAIN}" \
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
kubectl create secret tls sonatype-nexus.tls-secret \
  --cert='/etc/ssl/certs/sonatype-nexus/root-ca.crt' \
  --key='/etc/ssl/private/sonatype-nexus/root-ca.key' \
  -n sonatype-nexus
```

```sh
helm upgrade sonatype-nexus stable/sonatype-nexus -f <(yq m <(cat << EOF
ingress:
  tls:
    enabled: true
    secretName: sonatype-nexus.tls-secret
EOF
) <(helm get values sonatype-nexus))
```

#### Remove

```sh
helm upgrade sonatype-nexus stable/sonatype-nexus -f <(yq d <(helm get values sonatype-nexus) ingress.tls)

kubectl delete secret sonatype-nexus.tls-secret -n sonatype-nexus
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
  --docker-server='https://registry.${DOMAIN}' \
  --docker-username='admin' \
  --docker-password='[password]' \
  --docker-email='admin@xyz.tld' \
  -n default
```

```sh
kubectl get secret nxrm-oss-regcred \
  -o jsonpath='{.data.\.dockerconfigjson}' \
  -n default | \
    base64 -d | jq .
```

```sh
kubectl patch serviceaccount default -p '{"imagePullSecrets":[{"name":"nxrm-oss-regcred"}]}' -n default
```

```sh
docker login \
  -u admin \
  registry.${DOMAIN}
```

```sh
docker pull docker.io/library/alpine:3.9
docker tag docker.io/library/alpine:3.9 registry.${DOMAIN}/library/alpine:3.9
docker push registry.${DOMAIN}/library/alpine:3.9
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
Error response from daemon: Get http://registry.${DOMAIN}/v2/: dial tcp: lookup registry.${DOMAIN} on [ip]:53: server misbehaving
```

<!-- ```sh
minikube ssh -- sudo cat /etc/hosts
```

```sh
minikube ssh -- "sudo /usr/bin/sh -c 'echo -e \"$(kubectl get service nginx-ingress-controller -o jsonpath='{.status.loadBalancer.ingress[0].ip}' -n nginx-ingress)\tregistry.${DOMAIN}\" >> /etc/hosts'"
``` -->

#### Repository Missing

```log
Error response from daemon: Get https://registry.${DOMAIN}/v2/: net/http: request canceled (Client.Timeout exceeded while awaiting headers)
```

Try create a [hosted docker repository](/sonatype-nexus.md#hosted).

#### Self Signed Certificate

```log
Get https://registry.${DOMAIN}/v2/: x509: certificate signed by unknown authority
```

Add address `registry.${DOMAIN}` to insecure registry in docker daemon.

### Delete

```sh
helm uninstall sonatype-nexus \
  -n sonatype-nexus

kubectl delete ns sonatype-nexus \
  --grace-period=0 \
  --force
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
