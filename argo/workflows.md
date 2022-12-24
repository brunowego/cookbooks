# Argo Workflows

<!--
https://www.datarevenue.com/en-blog/airflow-vs-luigi-vs-argo-vs-mlflow-vs-kubeflow
-->

**Keywords:** Data Workflow

## Links

- [Code Repository](https://github.com/argoproj/argo-workflows)

## Custom Resource (CR)

### Install

```sh
#
kubectl create ns argo

#
kubectl apply \
  -n argo \
  -f 'https://raw.githubusercontent.com/argoproj/argo-workflows/master/manifests/quick-start-postgres.yaml'

#
kubectl wait \
  --namespace argo \
  --for=condition=ready pod \
  --selector=app=workflow-controller \
  --timeout=90s

#
kubectl port-forward \
  deployment/argo-server \
  --address 0.0.0.0 \
  -n argo \
  2746:2746

#
echo -e '[INFO]\thttps://127.0.0.1:2746'
```

### Uninstall

```sh
#
kubectl delete \
  -n argo \
  -f 'https://raw.githubusercontent.com/argoproj/argo-workflows/master/manifests/quick-start-postgres.yaml'

#
kubectl delete ns argo
```

## CLI

### Installation

#### Homebrew

```sh
brew tap argoproj/tap
brew install argo
```

### Commands

```sh
argo -h
```

### Usage

```sh
#
export ARGO_SERVER='https://127.0.0.1:2746'
export ARGO_SERVER='127.0.0.1:2746'
export ARGO_HTTP1='true'
export ARGO_SECURE='true'
export ARGO_BASE_HREF=''
export ARGO_TOKEN=''
export ARGO_NAMESPACE='argo'
export ARGO_INSECURE_SKIP_VERIFY='true'

#
export KUBECONFIG='/dev/null'

#
argo list
```

<!--
#
argo lint ./pipelines/*.yaml

#
export GITHUB_SHA=''

argo submit ./pipelines/dl.yaml \
  --labels assign-part=p1,model=sentiment \
  -p notebook-name=Assignment_2_p1 \
  -p mlflow-experiment=np-dl-2-p1-sentiment \
  -p git-ref="${GITHUB_SHA}"
-->
