# Tekton Pipelines

http://heidloff.net/article/deploying-microprofile-microservices-tekton/
http://heidloff.net/article/ibm-cloud-kubernetes-tekton/
https://github.com/tektoncd/catalog
http://sharepointoscar.com/2019-04-22-using-tekton-pipelines-in-jenkins-x-part-1/

## Helm

### References

- [Configuration](https://github.com/IBM/charts/tree/master/community/tekton-pipelines#configuration)

### Repository

```sh
helm repo add ibm-community-charts https://raw.githubusercontent.com/IBM/charts/master/repo/community
helm repo update ibm-community-charts
```

### Install

```sh
helm install ibm-community-charts/tekton-pipelines \
  -n tekton-pipelines
```

### Status

```sh
kubectl rollout status deploy/tekton-pipelines-controller -n tekton-pipelines
```

### Logs

```sh
kubectl logs -l 'app=tekton-pipelines-controller' -n tekton-pipelines -f
kubectl logs -l 'app=tekton-pipelines-webhook' -n tekton-pipelines -f
```

### DNS

```sh
dig @10.96.0.10 tekton-pipelines-controller.tekton-pipelines.svc.cluster.local +short
nslookup tekton-pipelines-controller.tekton-pipelines.svc.cluster.local 10.96.0.10
```

### Delete

```sh
helm delete tekton-pipelines --purge
```
