# Kubeflow

https://www.youtube.com/watch?v=S7qpvr2bZ2U

## minikube

```sh
export KUBEFLOW_SRC="$PWD/src"
export KUBEFLOW_TAG="v0.4.1"
export KFAPP="mykfapp"

mkdir -p $KUBEFLOW_SRC && cd "$_"

curl -Ss "https://raw.githubusercontent.com/kubeflow/kubeflow/${KUBEFLOW_TAG}/scripts/download.sh" | /bin/bash
```

```sh
kubectl get node
eval "$(minikube docker-env)"
```

```sh
KUBEFLOW_REPO=${KUBEFLOW_SRC} ${KUBEFLOW_SRC}/scripts/kfctl.sh init ${KFAPP} --platform minikube
cd ${KFAPP}
${KUBEFLOW_SRC}/scripts/kfctl.sh generate all
${KUBEFLOW_SRC}/scripts/kfctl.sh apply all
```
