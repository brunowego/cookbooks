# Apache OpenWhisk

<!--
https://www.jowanza.com/blog/2018/11/11/serverless-machine-learning-openwhisk-mleap

https://medium.com/openwhisk/uncovering-the-magic-how-serverless-platforms-really-work-3cb127b05f71
https://softwareengineeringdaily.com/2018/06/26/function-platforms-with-chad-arimura-and-matt-stephenson/
https://github.com/wkorando/go-serverless-with-java
https://thenewstack.io/ibm-composer-provides-way-orchestrate-multiple-serverless-functions/
https://www.youtube.com/watch?v=Wqy2AHvhDGs
https://medium.com/openwhisk/advanced-debugging-of-openwhisk-actions-518414636932
https://www.raymondcamden.com/2017/06/05/quick-openwhisk-debugging-example//
https://elinux.org/images/b/b2/How_to_Build_a_Distributed_Serverless_Polyglot_Micro_Services_IoT_Platform_Using_Docker_and_OpenWhisk.pdf
https://dzone.com/articles/running-openwhisk-actions-from-node-red
https://www.microsoft.com/developerblog/2017/06/01/deploying-bots-using-the-serverless-framework/
https://techbeacon.com/enterprise-it/essential-guide-2019-serverless-ecosystem
https://read.acloud.guru/aws-lambda-vs-google-cloud-functions-vs-azure-functions-who-has-the-serverless-advantage-f6c2535e72f4
https://www.fiware.org/wp-content/uploads/2017/01/The-next-trend-in-application-development.-serveless-apps.pdf
https://willowtreeapps.com/ideas/serverless-architectures-for-multimodal-experiences
https://researcher.watson.ibm.com/researcher/files/us-tardieu/debs19.pdf
https://laptrinhx.com/five-minute-intro-to-open-source-serverless-development-with-openwhisk-3429525756/
http://jamesthom.as/blog/2017/01/18/openwhisk-and-rust/
https://serverlesscode.com/post/interview-andreas-nauerz-bluemix-openwhisk/
https://laptrinhx.com/openwhisk-and-rust-lang-3533657474/
http://heidloff.net/article/serverless-functions-typescript-openwhisk
https://dzone.com/articles/debugging-apache-openwhisk-functions-with-vs-code
http://heidloff.net/article/debug-apache-openwhisk-functions-vscode
https://github.com/nheidloff/openwhisk-debug-nodejs
https://github.com/nheidloff/openwhisk-polyglot
https://github.com/daisy-ycguo/openwhisk-demo
https://github.com/nerdguru/devnet-create-faas-on-k8s
http://parallel.princeton.edu/papers/micro19-shahrad.pdf
https://blog.zhaw.ch/splab/2019/03/15/building-a-sample-mqtt-based-application-on-openwhisk/
https://dalelane.co.uk/blog/?p=3741
https://github.com/blumareks/serverless-101-openwhisk
https://www.youtube.com/watch?v=zvFJFNvrOa8
https://www.youtube.com/watch?v=N0T8jkfkuEg
https://www.youtube.com/watch?v=uPohj7qoigY
https://www.youtube.com/watch?v=JPQwUcHkOEc
https://www.youtube.com/watch?v=xgTWKK69N38
https://www.youtube.com/watch?v=TWDrhVn0yTo
https://www.youtube.com/watch?v=Kv7yPcRUC0c
https://www.raymondcamden.com/2018/01/05/another-example-of-vuejs-and-vuex-an-api-wrapper
https://vshn.ch/en/blog/a-very-quick-comparison-of-kubernetes-serverless-frameworks/
https://www.nuweba.com/blog/open-source-serverless-projects
https://github.com/asqasq/serverless/tree/master/openwhisk/apps/imageclassify
https://github.com/orangefoil/install-openwhisk
https://www.youtube.com/watch?v=yXfitGShnc0&feature=youtu.be
https://github.com/bu-528-sp19/Functions-as-a-Service
-->

## Helm

### References

- [Documentation](https://openwhisk.apache.org/documentation.html#documentation)
- [Chart Details](https://github.com/apache/openwhisk-deploy-kube/tree/master/helm/openwhisk#chart-details)

### Install

```sh
kubectl label nodes --all openwhisk-role=invoker
```

```sh
kubectl create namespace openwhisk
```

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n openwhisk
```

```sh
git clone https://github.com/apache/openwhisk-deploy-kube.git
```

```sh
helm install openwhisk-deploy-kube/helm/openwhisk \
  -n openwhisk \
  --namespace openwhisk \
  --set whisk.ingress.apiHostName="openwhisk.$(minikube ip).nip.io" \
  --set whisk.ingress.apiHostPort='443' \
  --set whisk.ingress.type='Standard' \
  --set whisk.ingress.domain="openwhisk.$(minikube ip).nip.io" \
  --set whisk.ingress.tls.enabled=true \
  --set whisk.ingress.tls.secretenabled=true \
  --set whisk.ingress.tls.secretname='example.tls-secret' \
  --set whisk.ingress.annotations."nginx\.ingress\.kubernetes\.io/proxy-body-size"=0
```

```sh
rm -fR openwhisk-deploy-kube
```

```sh
curl -k "https://openwhisk.$(minikube ip).nip.io/v1/health-check"
```

### Status

```sh
kubectl rollout status daemonset/openwhisk-invoker -n openwhisk
```

### Logs

```sh
kubectl logs -l 'app=openwhisk-openwhisk,name=openwhisk-install-packages' -n openwhisk -f
kubectl logs -l 'app=openwhisk-openwhisk,name=openwhisk-init-couchdb' -n openwhisk -f

kubectl logs -l 'app=openwhisk-openwhisk,name=openwhisk-controller' -n openwhisk -f
kubectl logs -l 'app=openwhisk-openwhisk,name=openwhisk-couchdb' -n openwhisk -f
kubectl logs -l 'app=openwhisk-openwhisk,name=openwhisk-invoker' -n openwhisk -f

# more
kubectl logs -l 'app=openwhisk-openwhisk,name=openwhisk-alarmprovider' -n openwhisk -f
kubectl logs -l 'app=openwhisk-openwhisk,name=openwhisk-apigateway' -n openwhisk -f
kubectl logs -l 'app=openwhisk-openwhisk,name=openwhisk-cloudantprovider' -n openwhisk -f
kubectl logs -l 'app=openwhisk-openwhisk,name=openwhisk-kafka' -n openwhisk -f
kubectl logs -l 'app=openwhisk-openwhisk,name=openwhisk-kafkaprovider' -n openwhisk -f
kubectl logs -l 'app=openwhisk-openwhisk,name=openwhisk-nginx' -n openwhisk -f
kubectl logs -l 'app=openwhisk-openwhisk,name=openwhisk-redis' -n openwhisk -f
kubectl logs -l 'app=openwhisk-openwhisk,name=openwhisk-wskadmin' -n openwhisk -f
kubectl logs -l 'app=openwhisk-openwhisk,name=openwhisk-zookeeper' -n openwhisk -f
```

### DNS

```sh
dig @10.96.0.10 openwhisk-nginx.openwhisk.svc.cluster.local +short
nslookup openwhisk-nginx.openwhisk.svc.cluster.local 10.96.0.10
```

### Guest User

```sh
kubectl exec openwhisk-wskadmin \
  -n openwhisk \
  -- wskadmin user list guest
```

### Secret

```sh
kubectl get secret openwhisk-db.auth \
  -o jsonpath='{.data.db_username}' \
  -n openwhisk | \
    base64 --decode; echo

kubectl get secret openwhisk-db.auth \
  -o jsonpath='{.data.db_password}' \
  -n openwhisk | \
    base64 --decode; echo
```

```sh
kubectl get secret openwhisk-docker.registry.auth \
  -o jsonpath='{.data.docker_registry_username}' \
  -n openwhisk | \
    base64 --decode; echo

kubectl get secret openwhisk-docker.registry.auth \
  -o jsonpath='{.data.docker_registry_password}' \
  -n openwhisk | \
    base64 --decode; echo
```

```sh
kubectl get secret openwhisk-whisk.auth \
  -o jsonpath='{.data.guest}' \
  -n openwhisk | \
    base64 --decode; echo

kubectl get secret openwhisk-whisk.auth \
  -o jsonpath='{.data.system}' \
  -n openwhisk | \
    base64 --decode; echo
```

### Config Map

```sh
kubectl get configmap openwhisk-db.config -o yaml -n openwhisk
```

### Web UI

```sh
# Fauxton Visual Guide
echo -e '[INFO]\thttp://openwhisk-couchdb.openwhisk.svc.cluster.local:5984/_utils/'
```

### Delete

```sh
helm delete openwhisk --purge
kubectl delete namespace openwhisk --grace-period=0 --force
kubectl label nodes --all openwhisk-role-
```
