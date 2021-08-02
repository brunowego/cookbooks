# Kubernetes Control (kubectl)

<!--
https://github.com/nutellinoit/kubenvz

kubectl explain pod.spec.volumes
kubectl explain pods
-->

## CLI

### References

- [kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [Managing Secret using kubectl](https://kubernetes.io/docs/tasks/configmap-secret/managing-secret-using-kubectl/)

### Installation

#### Homebrew

```sh
brew install kubernetes-cli
```

#### Linux

```sh
sudo curl \
  -L "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" \
  -o '/usr/local/bin/kubectl' && \
    sudo chmod +x '/usr/local/bin/kubectl'
```

### Commands

```sh
kubectl --help
```

### Usage

```sh
#
kubectl get \
  --raw='/readyz?verbose'

#
kubectl get cs

# Config Context
kubectl config current-context

# Expose
kubectl expose deploy nginx \
  --port 80 \
  --type LoadBalancer

# Proxy
nohup kubectl proxy \
  --address=0.0.0.0 \
  --port=8001 \
  --accept-hosts=.* \
  &> /dev/null &

kill -9 "$(lsof -nPi tcp:8001 | grep LISTEN | awk '{print $2}')"

# Copy
kubectl cp ./path/to/folder/or/file [namespace]/[podname]:/path/to/where/save

#
kubectl get pod -A
kubectl get pod -n [namespace]

#
kubectl describe pod -l 'app=[appname]' -n [namespace]

#
kubectl logs \
  -l 'app=[appname]' \
  -c [container] \
  -n [namespace] \
  -f

kubectl
  --context '[cluster-name]' \
  logs \
    -n '[namespace]' \
    '[pod-name]'
    -f
```

#### Top

```sh
#
kubectl top node

#
kubectl top pod '[pod-name]' \
  -n '[namespace]'
```

#### Config Map

```sh
kubectl get cm \
  -A \
  --show-labels
```

#### Secrets

```sh
# List
kubectl get secrets -n [namespace]

# Create


# Describe
kubectl describe secret [secret-name] -n [namespace]

# Get Data
kubectl get secret [secret-name] -o jsonpath='{.data}' -n [namespace] | jq .
kubectl get secret [secret-name] --template={{.data.bar}} -n [namespace] | base64 --decode

# Delete
kubectl delete secret [secret-name] -n [namespace]
```

### Tips

#### Batch Delete

```sh
kubectl get deployments | \
  grep [text] | \
    awk '{print $1}' | \
      xargs kubectl delete deploy
```

<!-- ####

```sh
kubectl patch cronjobs [name] \
  -p '{"spec":{"suspend":true}}'
``` -->

#### Consulting kubeconfig

```sh
#
cat ~/.kube/config | yq e '.clusters[].cluster.server' -
cat ~/.kube/config | yq e '.clusters[0].cluster.server' -

#
cat ~/.kube/config | yq e '.clusters[0].cluster.certificate-authority-data' - | base64 -d

#
cat ~/.kube/config | yq e '.users[0].user.client-certificate-data' - | base64 -d

#
cat ~/.kube/config | yq e '.users[0].user.client-key-data' - | base64 -d
```

#### API Request Example

```sh
#
curl \
  "$(cat ~/.kube/config | yq e '.clusters[0].cluster.server' -)/api/v1/namespaces/default/pods?limit=10" \
  --cacert <(cat ~/.kube/config | yq e '.clusters[0].cluster.certificate-authority-data' - | base64 -d) \
  --cert <(cat ~/.kube/config | yq e '.users[0].user.client-certificate-data' - | base64 -d) \
  --key <(cat ~/.kube/config | yq e '.users[0].user.client-key-data' - | base64 -d)
```

#### Command-line completion

```sh
# Using Oh My Zsh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 kubectl\)/g' ~/.zshrc

source ~/.zshrc

rm ~/.zcompdump*

# Using native command
## for zsh
source <(kubectl completion zsh)

## for bash
source <(kubectl completion bash)
```

<!-- ####

```sh
kubectl exec -it \
  [pod] \
  -c [name] \
  -- /bin/bash
``` -->

#### Proxy

```sh
kubectl proxy \
  --accept-hosts='^*$' \
  --address='0.0.0.0'
```

#### Restart

```sh
#
kubectl rollout restart \
  deployment \
  -n [namespace] \
  [name]

#
kubectl scale deployment \
  --replicas 0 \
  $(kubectl get deployment -l 'app=[appname]' -o jsonpath='{.items[0].metadata.name}' -n [namespace]) \
  -n [namespace]
```

#### Config

```sh
#
kubectl config set-context \
  --current \
  --namespace [namespace]
```

#### Scale

```sh
# Deployment
kubectl scale \
  --replicas=2 \
  -n '[namespace]' \
  deploy/[name]

# ReplicaSet
kubectl scale \
  --replicas=2 \
  -n '[namespace]' \
  rs/[name]
```

#### Edit

```sh
#
kubectl get deploy \
  -n '[namespace]'

kubectl edit \
  -n '[namespace]' \
  deploy/[name]

#
kubectl get hpa \
  -n '[namespace]'

kubectl edit  \
  -n '[namespace]' \
  hpa/[name]
```

<!-- ```sh
kubectl exec -it \
  $(kubectl get pod -l 'app=[appname]' -o jsonpath='{.items[0].metadata.name}' -n [namespace]) \
  -n [namespace] \
  -- /bin/sh -c 'kill 1'
``` -->

<!-- ####

```sh
kubectl get pod [name] -n [namespace] -o yaml | \
  sed 's/restartPolicy: Always/restartPolicy: Never/' | \
    kubectl apply -f -
``` -->

<!-- ####

```sh
#
kubectl proxy --port=8080 &

#
export NS=[namespace]

#
kubectl create ns "$NS" --dry-run -o json > /tmp/ns.json

#
curl \
  -X PUT \
  -H 'Content-Type: application/json' \
  -k \
  --data-binary @/tmp/ns.json \
  "http://localhost:8080/api/v1/namespaces/$NS/finalize"

#
rm /tmp/ns.json
``` -->

#### Snippets

```sh
# create
cat << EOF | kubectl create -f -

EOF

# apply
cat << EOF | kubectl apply -f -

EOF

# replace
cat << EOF | kubectl replace --force -f -

EOF
```

#### Force Delete

```sh
kubectl delete pod [name] --grace-period=0 --force -n [namespace]
```

#### Terminating

##### Pod

```sh
#
kubectl patch pod [name] \
  -p '{"metadata":{"finalizers":[]}}' \
  -n [namespace]

#
kubectl delete pod [name] \
  -n [namespace] \
  --grace-period 0 \
  --force
```

##### Namespace

```sh
for ns in `kubectl get ns --field-selector status.phase=Terminating -o name`; do kubectl patch $ns -p '{"metadata":{"finalizers":[]}}' --type='merge'; done
```

###### API Resources

```sh
for ns in `kubectl get ns --field-selector status.phase=Terminating -o name | cut -d / -f 2`; do for resource in `kubectl api-resources --namespaced -o name --verbs=list | xargs -n 1 kubectl get -o name -n $ns`; do kubectl patch $resource -p '{"metadata": {"finalizers": []}}' --type='merge' -n $ns; done; done
```

###### REST API

```sh
#
kubectl proxy

#
kubectl get ns [namespace] -o json | \
  jq '.spec.finalizers=[]' | \
  curl \
    -X PUT \
    -H 'Content-Type: application/json' \
    --data @- \
    http://localhost:8001/api/v1/namespaces/[namespace]/finalize
```

<!-- ###

```sh
kubectl patch pvc redis-data-polyaxon-redis-master-0 -p '{"spec":{"storageClassName":"nas-client"}}' -n polyaxon
kubectl patch pvc redis-data-polyaxon-redis-master-0 -p '{"spec":{"resources":{"requests":{"storage":"16Gi"}}}}' -n polyaxon
``` -->

<!-- ###

```sh
kubectl get pod -l 'app=docker-registry' -n polyaxon -o yaml | \
  sed '/image: /s|registry|[hostname]:5001/library/registry|' | \
    kubectl apply -f -
``` -->

<!-- ###

```sh
kubectl create secret generic $*-values-b64 \
  --namespace=hush-house-main \
  --from-literal="value=$(shell cat ./$*/.values.yaml | base64)" \
  --dry-run \
  --output yaml | kubectl apply -f -
``` -->

<!-- ###

```sh
kubectl get configmap coredns -n kube-system -o yaml | \
  sed 's/loop/#loop/g' | \
  kubectl apply -f -
``` -->

#### Certificate from Namespace

```sh
kubectl get secret $(kubectl get secrets -n [namespace] | grep 'default-token' | cut -d ' ' -f 1) \
  -o jsonpath='{.data.ca\.crt}' \
  -n [namespace] | \
    base64 --decode > ./ca.crt
```

#### Config

##### Read

```sh
# Remote
scp -q '[username]@[hostname]:~/.kube/config' /dev/stdout | yq r -

# Vagrant
vagrant ssh -c 'cat ~/.kube/config'
```

##### Import

```sh
# Remote Host
scp -q '[username]@[hostname]:~/.kube/config' /dev/stdout > /tmp/config

# Vagrant
vagrant ssh -c 'cat ~/.kube/config' | tee /tmp/config
```

```sh
sed -i 's/kubernetes/[new-name]/' /tmp/config
```

```sh
yq m -ai ~/.kube/config /tmp/config
```

```sh
rm /tmp/config
```

```sh
kubectl config view
```

<!-- ### Tips

####

```sh
kubectl rollout restart deployment \
  -n [namespace] \
  [...services]
``` -->

### Issues

<!-- ####

```log
Error: unable to build kubernetes objects from release manifest: unable to recognize "": no matches for kind "Deployment" in version "apps/v1beta2"
```

TODO -->

<!-- ####

```log
Warning  FailedScheduling  2m10s (x3 over 3m34s)  default-scheduler   0/9 nodes are available: 1 node(s) had taint {node-role.kubernetes.io/master: }, that the pod didn't tolerate, 7 Insufficient memory, 8 Insufficient cpu.
```

TODO -->

<!-- ####

```log
error: You must be logged in to the server (Unauthorized)
```

```sh
#
kubectl version --client -o json | jq -r '.clientVersion.gitVersion | gsub("[v]"; "")'

#
AWS_PROFILE=dev kubectl version --short

#
AWS_PROFILE=dev aws sts get-caller-identity
``` -->

<!-- ####

```log
could not get token: NoCredentialProviders: no valid providers in chain. Deprecated.
	For verbose messaging see aws.Config.CredentialsChainVerboseErrors
Unable to connect to the server: getting credentials: exec: executable aws-iam-authenticator failed with exit code 1
```

TODO -->

#### Proxy

```log
proxyconnect tcp: dial tcp [ip]:3128: i/o timeout
```

```sh
kubectl get pod \
  -l 'component=kube-apiserver' \
  -o jsonpath='{.items[0].spec.containers[0].env}' \
  -n kube-system
```

```sh
# Linux
sudo vim /etc/kubernetes/manifests/kube-apiserver.yaml
sudo systemctl restart kubelet
```

#### Probe

```log
Liveness probe failed: HTTP probe failed with statuscode: 503
Readiness probe failed: HTTP probe failed with statuscode: 503
```

```sh
export POD_NAME=$(kubectl get deploy -l 'app=keras-mnist-deployment-keras-mnist-predictor-317c92e' -o jsonpath='{.items[0].metadata.name}')

kubectl describe pod "$POD_NAME"

kubectl patch deploy "$POD_NAME" -p '{"spec":{"replicas":0}}'

kubectl patch deploy "$POD_NAME" --type='json' -p '[{"op":"remove","path":"/spec/template/spec/containers/0/livenessProbe"}]'
kubectl patch deploy "$POD_NAME" --type='json' -p '[{"op":"remove","path":"/spec/template/spec/containers/0/readinessProbe"}]'
```

<!-- ###

```sh
kubectl config set-cluster --certificate-authority=certificate-authority-data --embed-certs=true --server='https://myk8sclust-myresourcegroup-7c08a0mgmt.westeurope.cloudapp.azure.com' azure

kubectl config set-credentials azure --client-certificate=client-certificate-data --client-key=client-key-data --embed-certs=true

kubectl config set-context \
  --cluster=azure \
  --user=azure \
  azure

kubectl config view
``` -->

### Docs

#### Rancher

1. Clusters
2. Select a Cluster Name
3. Kubeconfig File

```sh
#
~/.kube/config

#
kubectx [vendor]-[env]

#
kubectl get pod -n [namespace]

#
kubectl exec -it \
  $(kubectl get pod -l 'app=[app-name]' -o jsonpath='{.items[0].metadata.name}' -n [namespace]) \
  -n [namespace] \
  -- /bin/sh
```

<!--
kubectl config set-cluster asdf.com --insecure-skip-tls-verify=true

kubectl port-forward \
  --namespace keycloak \
  svc/keycloak-postgresql \
  5432:5432
-->
