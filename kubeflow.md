# Kubeflow

<!--
https://app.pluralsight.com/course-player?courseId=e23412c1-73e0-41f4-9a6b-7c48972bf4f9

https://www.youtube.com/watch?v=S7qpvr2bZ2U

https://www.linkedin.com/learning/leveraging-cloud-based-machine-learning-on-google-cloud-platform-real-world-applications/

https://app.pluralsight.com/library/courses/building-end-to-end-machine-learning-workflows-kubeflow/
https://app.pluralsight.com/library/courses/mlops-machine-learning-operations-fundamentals/
https://app.pluralsight.com/library/courses/ml-pipelines-google-cloud/
-->

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
