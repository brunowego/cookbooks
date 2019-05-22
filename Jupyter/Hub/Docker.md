# Docker

## Running

```sh
docker run -d \
  -h jupyterhub \
  -p 8000:8000 \
  --name jupyterhub \
  --restart always \
  jupyterhub/jupyterhub:1.0.0 jupyterhub -f /srv/jupyterhub/jupyterhub_config.py
```

```sh
docker exec -i jupyterhub /bin/sh << 'SHELL'
cat << 'EOF' > /srv/jupyterhub/jupyterhub_config.py
c.JupyterHub.hub_ip = '0.0.0.0'
c.JupyterHub.hub_port = 8000
EOF
SHELL
```

```sh
docker restart jupyterhub
```

```sh
docker exec -i jupyterhub useradd $USER
docker exec -i jupyterhub passwd $USER
```

## Remove

```sh
docker rm -f jupyterhub
```
