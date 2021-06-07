# Kubeflow

<!--
https://www.youtube.com/watch?v=-rdabPmA-lk

https://app.pluralsight.com/course-player?courseId=e23412c1-73e0-41f4-9a6b-7c48972bf4f9

https://www.youtube.com/watch?v=S7qpvr2bZ2U

https://www.linkedin.com/learning/leveraging-cloud-based-machine-learning-on-google-cloud-platform-real-world-applications/

https://app.pluralsight.com/library/courses/building-end-to-end-machine-learning-workflows-kubeflow/
https://app.pluralsight.com/library/courses/mlops-machine-learning-operations-fundamentals/
https://app.pluralsight.com/library/courses/ml-pipelines-google-cloud/
-->

## Links

- [Code Respository](https://github.com/kubeflow/kubeflow)

<!-- ## Using minikube

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
``` -->

## Using kind

### Dependencies

- [Kubernetes IN Docker (kind)](/kind.md)

### Running

```sh
#
kind create cluster \
  --name 'kf-pipeline' \
  --config ~/.kind-config.yml

#
export KF_PIPELINE_VERSION='1.5.0'

#
kubectl apply -k "github.com/kubeflow/pipelines/manifests/kustomize/cluster-scoped-resources?ref=${KF_PIPELINE_VERSION}"

#
kubectl wait \
  --for condition=established \
  --timeout=300s \
  crd/applications.app.k8s.io

#
kubectl apply \
  -k "github.com/kubeflow/pipelines/manifests/kustomize/env/platform-agnostic-pns?ref=${KF_PIPELINE_VERSION}" \
  --timeout=60s

#
kubectl get pods \
  -n kubeflow \
  -o wide
```

> Wait! This process take a while.

```sh
#
kubectl port-forward \
  -n kubeflow \
  svc/ml-pipeline-ui \
  8080:80

#
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Delete

```sh
#
kubectl delete \
  -k "github.com/kubeflow/pipelines/manifests/kustomize/env/platform-agnostic-pns?ref=${KF_PIPELINE_VERSION}" \
  --timeout=60s

kubectl delete -k "github.com/kubeflow/pipelines/manifests/kustomize/cluster-scoped-resources?ref=${KF_PIPELINE_VERSION}"

kind delete cluster --name 'kf-pipeline'
```
