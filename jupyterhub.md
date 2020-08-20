# JupyterHub

## Helm

### Repository

```sh
helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
helm repo update jupyterhub
```

### Install

```sh
kubectl create namespace jupyterhub
```

```sh
helm install jupyterhub/jupyterhub \
  -n jupyterhub \
  --namespace jupyterhub \
  --set proxy.secretToken="$(head -c 12 /dev/urandom | shasum | cut -d ' ' -f 1)" \
  --set ingress.enabled=true \
  --set ingress.hosts={jupyterhub.example.com}
```

| Login | Password |
| --- | --- |
| dummy | |

### Delete

```sh
helm delete jupyterhub --purge
kubectl delete namespace jupyterhub --grace-period=0 --force
```

## Docker

### Running

```sh
docker run -d \
  -h jupyterhub \
  -p 8000:8000 \
  --name jupyterhub \
  jupyterhub/jupyterhub:1.0.0 jupyterhub -f /srv/jupyterhub/jupyterhub_config.py
```

```sh
docker exec -i jupyterhub /bin/sh << EOSHELL
cat << EOF > /srv/jupyterhub/jupyterhub_config.py
c.JupyterHub.hub_ip = '0.0.0.0'
c.JupyterHub.hub_port = 8000

EOF
EOSHELL
```

```sh
docker restart jupyterhub
```

```sh
docker exec -i jupyterhub useradd $USER
docker exec -i jupyterhub passwd $USER
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8000'
```

### Remove

```sh
docker rm -f jupyterhub
```

## CLI

### Installation

#### PIP

```sh
pip install -U jupyterhub
```

### Commands

```sh
jupyterhub --help-all
```
