# Renku

## References

- [Running the platform](https://renku.readthedocs.io/en/latest/developer/setup.html)

## Installation

### Homebrew

```sh
brew install SwissDataScienceCenter/renku/renku
```

## minikube

### Requirements

- python 3.6+
- pipenv
- minikube
- kubectl
- helm (>= 2.9.1)
- GNU make

### Running

```sh
mkdir src && cd "$_"

git clone https://github.com/SwissDataScienceCenter/renku.git
cd renku/charts
```

```sh
pipenv shell
pipenv install
```

```sh
kubectl get node
eval "$(minikube docker-env)"
```

```sh
helm init
```

```sh
kubectl get pods -A -w
```

```sh
helm upgrade \
  --install nginx-ingress \
  --namespace kube-system \
  --set controller.hostNetwork=true \
  stable/nginx-ingress
```

```sh
helm repo add gitlab https://charts.gitlab.io
helm repo add jupyterhub https://jupyterhub.github.io/helm-chart
helm repo add renku https://swissdatasciencecenter.github.io/helm-charts
```

```sh
make minikube-deploy
```

```sh
helm test renku
```

```sh
xdg-open "http://$(minikube ip)" || open "http://$(minikube ip)" || echo -e "[INFO]\thttp://$(minikube ip)"
```

| Login | Password |
| --- | --- |
| demo | demo |
| `admin` | `admin` |

| Endpoint | Description |
| --- | --- |
| `/` | Renku web UI |
| `/auth` | Keycloak, identity manager |
| `/auth/admin/` | Keycloak admin console |
| `/gitlab` | GitLab |
