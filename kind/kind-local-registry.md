# Kubernetes IN Docker (KIND) Local Registry

## Links

- [Docs](https://kind.sigs.k8s.io/docs/user/local-registry/)

## Running

### Local Docker Registry

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h registry \
  -v docker-registry-data:/var/lib/registry \
  -v docker-registry-config:/etc/docker/registry \
  -p 5000:5000 \
  --name docker-registry \
  --restart always \
  docker.io/library/registry:2

#
docker inspect \
  -f '{{.State.Running}}' \
  docker-registry
```

### Bootstrap KIND

```sh
#
cat << EOF | kind create cluster \
  --name 'default' \
  --config -
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
containerdConfigPatches:
- |-
  [plugins.'io.containerd.grpc.v1.cri'.registry.mirrors.'localhost:5000']
    endpoint = ['http://docker-registry:5000']
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: 'ingress-ready=true'
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
  - containerPort: 443
    hostPort: 443
    protocol: TCP
- role: worker
- role: worker
- role: worker
EOF
```

### Connect Docker Registry to KIND

```sh
#
docker network connect kind docker-registry

#
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ConfigMap
metadata:
  name: local-registry-hosting
  namespace: kube-public
data:
  localRegistryHosting.v1: |
    host: localhost:5000
    help: https://kind.sigs.k8s.io/docs/user/local-registry/
EOF
```

### Test

```sh
#
docker pull gcr.io/google-samples/hello-app:1.0

#
docker tag gcr.io/google-samples/hello-app:1.0 localhost:5000/hello-app:1.0

#
docker push localhost:5000/hello-app:1.0

#
curl -X GET 'http://127.0.0.1:5000/v2/_catalog'
```

### Delete

```sh
docker volume rm \
  docker-registry-data \
  docker-registry-config
```
