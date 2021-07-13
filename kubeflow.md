# Kubeflow

<!--
https://www.youtube.com/watch?v=-rdabPmA-lk

https://app.pluralsight.com/course-player?courseId=e23412c1-73e0-41f4-9a6b-7c48972bf4f9

https://www.youtube.com/watch?v=S7qpvr2bZ2U

https://linkedin.com/learning/leveraging-cloud-based-machine-learning-on-google-cloud-platform-real-world-applications/

https://app.pluralsight.com/library/courses/building-end-to-end-machine-learning-workflows-kubeflow/
https://app.pluralsight.com/library/courses/mlops-machine-learning-operations-fundamentals/
https://app.pluralsight.com/library/courses/ml-pipelines-google-cloud/
-->

## Links

- [Code Respository](https://github.com/kubeflow/kubeflow)

## Resource Manifest

### Install

```sh
#
export KF_PIPELINE_VERSION='1.5.0'

#
kubectl apply -k "github.com/kubeflow/pipelines/manifests/kustomize/cluster-scoped-resources?ref=${KF_PIPELINE_VERSION}"

#
kubectl wait \
  --for 'condition=established' \
  --timeout '300s' \
  crd/applications.app.k8s.io

#
kubectl apply \
  -k "github.com/kubeflow/pipelines/manifests/kustomize/env/platform-agnostic-pns?ref=${KF_PIPELINE_VERSION}" \
  --timeout '60s'

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

### Uninstall

```sh
#
kubectl delete \
  -k "github.com/kubeflow/pipelines/manifests/kustomize/env/platform-agnostic-pns?ref=${KF_PIPELINE_VERSION}" \
  --timeout=60s

kubectl delete \
  -k "github.com/kubeflow/pipelines/manifests/kustomize/cluster-scoped-resources?ref=${KF_PIPELINE_VERSION}"
```
