# Seldon Core

<!--
https://github.com/IBM/FfDL/tree/master/community/FfDL-Seldon/pytorch-model
https://github.com/SeldonIO/seldon-core/issues/644
https://github.com/danielfrg/polyaxon-argo-seldon-example
-->

## References

- [Testing Your Seldon Components](https://docs.seldon.io/projects/seldon-core/en/latest/workflow/api-testing.html)
- [Models Examples](https://github.com/SeldonIO/seldon-core/tree/master/examples/models)

## Helm

### References

- [Helm Charts](https://github.com/SeldonIO/seldon-core/tree/master/helm-charts)

### Dependencies

- [Ambassador](/ambassador.md)

### Repository

```sh
helm repo add seldon https://storage.googleapis.com/seldon-charts
helm repo update seldon
```

### Install

```sh
kubectl create namespace seldon-system
```

```sh
helm install seldon/seldon-core-operator \
  -n seldon-core \
  --namespace seldon-system
```

### Status

```sh
kubectl rollout status statefulset/seldon-operator-controller-manager -n seldon-system
```

### Issues

####

```log
Error from server (InternalError): error when creating "deployment.json": Internal error occurred: failed calling webhook "mutating-create-update-seldondeployment.seldon.io": Post https://webhook-server-service.seldon-system.svc:443/mutating-create-update-seldondeployment?timeout=30s: x509: certificate signed by unknown authority
```

```sh
kubectl logs $(kubectl get pod -l 'app.kubernetes.io/name=seldon-core-operator' -o jsonpath='{.items[0].metadata.name}' -n seldon-system) -n seldon-system -f
```

kubectl delete mutatingwebhookconfigurations mutating-webhook-configuration
kubectl delete validatingwebhookconfiguration validating-webhook-configuration

<!-- ```log
{"level":"info","ts":1567519576.9951558,"logger":"kubebuilder.admission.cert.writer","msg":"cert is invalid or expiring, regenerating a new one"}
``` -->

<!-- ```sh
kubectl exec -it \
  $(kubectl get pod -l 'app.kubernetes.io/name=seldon-core-operator' -o jsonpath='{.items[0].metadata.name}' -n seldon-system) \
  -n seldon-system \
  -- /bin/bash
``` -->

<!-- kubectl describe pod -l 'app.kubernetes.io/name=seldon-core-operator' -n seldon-system -->

<!-- ```sh
kubectl delete pod $(kubectl get pod -l 'app.kubernetes.io/name=seldon-core-operator' -o jsonpath='{.items[0].metadata.name}' -n seldon-system) -n seldon-system
``` -->

### Delete

```sh
helm delete seldon-core --purge
kubectl delete namespace seldon-system --grace-period=0 --force
```

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h seldon-core-s2i-python36 \
  --name seldon-core-s2i-python36 \
  docker.io/seldonio/seldon-core-s2i-python36:0.4 /bin/bash
```

## CLI

### Installation

#### PIP

```sh
pip install -U seldon-core
```

### Commands

```sh
seldon-core-tester -h
seldon-core-api-tester -h
seldon-core-microservice -h
seldon-core-microservice-tester -h
```

### Examples

#### cURL

```sh
seldon-core-microservice IrisClassifier REST
```

```sh
curl \
  -X POST \
  -d 'json=
{
  "data": {
    "names": [
      "sepal_length",
      "sepal_width",
      "petal_length",
      "petal_width"
    ],
    "ndarray": [
      [
        4.343,
        3.409,
        6.836,
        1.149
      ]
    ]
  }
}' \
  127.0.0.1:5000/predict
```
