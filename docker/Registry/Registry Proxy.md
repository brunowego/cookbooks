# Registry Proxy

- [Repository](https://github.com/rpardini/docker-registry-proxy)

## Running

```sh
docker run -d \
  -e REGISTRIES='k8s.gcr.io gcr.io quay.io' \
  -p 0.0.0.0:3128:3128 \
  -v /var/lib/docker/registry/cache:/docker_mirror_cache \
  -v /etc/ssl/certs/docker/registry:/ca \
  --name docker-registry-proxy \
  --restart always \
  rpardini/docker-registry-proxy:0.2.4
```

## Certificate

### CentOS

```sh
curl http://127.0.0.1:3128/ca.crt | sudo tee /etc/pki/ca-trust/source/anchors/docker-registry-proxy.crt
```

```sh
sudo update-ca-trust
```

```sh
sudo systemctl restart docker
```

## Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Docker Proxy
export DOCKER_PROXY_HOST="[hostname]"
export DOCKER_PROXY_PORT="3128"

# Docker HTTP(S) Proxy
export docker_http_proxy="http://$DOCKER_PROXY_HOST:$DOCKER_PROXY_PORT"
export docker_https_proxy="$docker_http_proxy"
```

```sh
sudo su - $USER
```

## Proxy

```sh
sudo mkdir -p /etc/sysconfig
```

```sh
sudo tee /etc/sysconfig/docker << EOF
HTTP_PROXY=$docker_http_proxy
HTTPS_PROXY=$docker_https_proxy
http_proxy=$docker_http_proxy
https_proxy=$docker_https_proxy
EOF
```

```sh
sudo mkdir -p /etc/systemd/system/docker.service.d
```

```sh
sudo sh -c 'echo -e "[Service]\nEnvironmentFile=-/etc/sysconfig/docker" >> /etc/systemd/system/docker.service.d/http-proxy.conf'
```

```sh
sudo systemctl daemon-reload
sudo systemctl show --property EnvironmentFiles docker
sudo systemctl restart docker
```

```sh
docker info | grep Proxy
```

## Test

```sh
curl http://127.0.0.1:3128
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
