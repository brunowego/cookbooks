# docker-registry-proxy

## References

- [Repository](https://github.com/rpardini/docker-registry-proxy)

## Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -e REGISTRIES='k8s.gcr.io gcr.io quay.io' \
  -p 3128:3128 \
  -v /var/lib/docker/registry/cache:/docker_mirror_cache \
  -v /etc/ssl/certs/docker/registry:/ca \
  --name docker-registry-proxy \
  rpardini/docker-registry-proxy:0.2.4
```

```sh
curl -i 'http://127.0.0.1:3128'
```

## Certificate

### Docker Machine

```sh
docker-machine ssh default << EOF
cd /etc/docker/certs.d
sudo mkdir \
  k8s.gcr.io \
  gcr.io \
  quay.io
EOF
```

```sh
docker-machine ssh default << EOF
cd /etc/docker/certs.d
curl 'http://127.0.0.1:3128/ca.crt' | \
  sudo tee \
    k8s.gcr.io/ca.crt \
    gcr.io/ca.crt \
    quay.io/ca.crt
EOF
```

### Darwin

```sh
wget 'http://127.0.0.1:3128/ca.crt'
```

```sh
sudo security add-trusted-cert -d \
  -r trustRoot \
  -k /Library/Keychains/System.keychain \
  ./ca.crt
```

```sh
rm ca.crt
```

### Ubuntu

```sh
curl 'http://127.0.0.1:3128/ca.crt' | sudo tee '/usr/local/share/ca-certificate/docker-registry-proxy.crt'
echo 'docker-registry-proxy.crt' >> '/etc/ca-certificates.conf'
```

```sh
sudo update-ca-certificates
```

```sh
sudo systemctl restart docker
```

### CentOS

```sh
curl 'http://127.0.0.1:3128/ca.crt' | sudo tee '/etc/pki/ca-trust/source/anchors/docker-registry-proxy.crt'
```

```sh
sudo update-ca-trust
```

```sh
sudo systemctl restart docker
```

## Environment

```sh
# Proxy
export PROXY_HOST='[hostname]'
export PROXY_PORT='3128'
export NO_PROXY='localhost,127.0.0.1'

# HTTP(S) Proxy
export http_proxy="http://$PROXY_HOST:$PROXY_PORT"
export https_proxy="$http_proxy"
export no_proxy="$NO_PROXY"
```

## Configuration

Configure [docker](/docker_proxy.md) or [docker-machine](/docker-machine_proxy.md) to use proxy.

## Test

```sh
curl 'http://127.0.0.1:3128'
```

```sh
time docker pull k8s.gcr.io/kube-proxy-amd64:v1.10.4
```

```sh
docker rmi k8s.gcr.io/kube-proxy-amd64:v1.10.4
```

```sh
time docker pull k8s.gcr.io/kube-proxy-amd64:v1.10.4
```
