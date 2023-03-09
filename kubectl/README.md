# Kubernetes Control (kubectl)

<!--
https://github.com/nutellinoit/kubenvz

kubectl explain pod.spec.volumes
kubectl explain pods
-->

## References

- [Main Website](https://kubernetes.io/docs/tasks/tools/)
- [kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [Managing Secret using kubectl](https://kubernetes.io/docs/tasks/configmap-secret/managing-secret-using-kubectl/)

## Tools

- [Krew](/krew.md)

## CLI

**Prefer:** [Kubectl Version Manager](./version-manager.md)

### Installation

#### Homebrew

```sh
brew install kubectl # or, kubernetes-cli
# brew install kubectl@1.22
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

### Environment

For Bash or Zsh, put something like this in your `$HOME/.zshrc`:

```sh
# Kubernetes Control (kubectl)
command -v kubectl >/dev/null && source <(kubectl completion zsh) # bash
alias k=kubectl
```

```sh
sudo su - "$USER"
```

### Usage

```sh
# Cluster Version
kubectl version --short

#
kubectl get \
  --raw='/readyz?verbose'

#
kubectl get cs

# Config Context
kubectl config get-contexts
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
kubectl cp ./path/to/folder/or/file <namespace>/<podname>:/path/to/where/save

#
kubectl get pod -A
kubectl get pod -n <namespace>

# Verbosity
kubectl get pods -v 6

#
kubectl describe pod -l 'app=<appname>' -n <namespace>

#
kubectl logs \
  -l 'app=<appname>' \
  -c <container> \
  -n <namespace> \
  -f

kubectl
  --context '<cluster-name>' \
  logs \
    -n '<namespace>' \
    '<pod-name>'
    -f
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
kubectl get secrets -n <namespace>

# Create
# TODO

# Describe
kubectl describe secret <secret-name> \
  -n <namespace>

# Get Data
kubectl get secret <secret-name> \
  -o jsonpath='{.data}' \
  -n <namespace> | \
    jq .

kubectl get secret <secret-name> \
  --template={{.data.bar}} \
  -n <namespace> | \
    base64 -d

# Delete
kubectl delete secret <secret-name> \
  -n <namespace>
```

### Tips

#### Autocomplete

```sh
# Using Oh My Zsh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 kubectl\)/g' ~/.zshrc

source ~/.zshrc

rm ~/.zcompdump*
```

#### Backup

```sh
# Backup
cat ~/.kube/config | gh gist create - -f kubeconfig

# Restore
gh gist list
gh gist view <hash> > ~/.kube/config
```

#### Delete Restarted Pods

```sh
#
kubectl get pods -A | awk '$5>0'

#
kubens <ns-name>

kubectl get pods --no-headers | \
  awk '$4>0' | \
    awk '{print $1}' | \
      xargs kubectl delete pod
```

#### Context Environment Variable

```sh
alias kubectl='kubectl --context="$KUBECTL_CONTEXT"'
alias helm='helm --kube-context="$KUBECTL_CONTEXT"'
alias stern='stern --context="$KUBECTL_CONTEXT"'
```

#### Delete All Pods

```sh
kubectl get pod -A -o yaml | \
  kubectl delete -f -
```

#### Docker Credential

<!--
cat << EOF | kubectl apply \
  -n <namespace> \
  -f -
apiVersion: v1
kind: Secret
type: kubernetes.io/dockerconfigjson
metadata:
  name: docker-registry
stringData:
  .dockerconfigjson: '$(aws --output json secretsmanager get-secret-value --secret-id '/global/infra/docker-registry' | jq -r .SecretString)'
EOF
-->

```sh
#
kubectl create secret generic docker-registry \
  --from-file=".dockerconfigjson=$HOME/.docker/config.json" \
  --type=kubernetes.io/dockerconfigjson
```

#### Filter Pods by IP

```sh
#
kubectl get pods -A -o wide | grep <ip-address>
```

#### Filter Nodes by IP

```sh
#
kubectl get nodes -o wide | grep <ip-address>
```

#### Rollout Restart Namespace

```sh
#
kubectl rollout restart deploy \
  -n <namespace>

#
kubectl rollout restart stateful \
  -n <namespace>

#
kubectl rollout restart daemonset \
  -n <namespace>
```

#### Get Cluster Server URL

```sh
kubectl config view \
  --minify \
  -o 'jsonpath={.clusters[0].cluster.server}'; echo
```

#### Get Context Config

```sh
kubectl config view \
  --minify \
  --flatten
```

#### Print Environment Variables

```sh
# Single
kubectl exec <pod-name> \
  -- printenv

# Multiple
kubectl get pods | \
  grep <text> | \
    awk '{print $1}' | \
      xargs -I '{}' kubectl exec '{}' -- printenv | \
        grep <ENV_NAME>
```

#### Delete Problematic Pod

```sh
#
kubens '<ns-name>'

#
kubectl delete pod $(kubectl get pods | awk '$3 == "CrashLoopBackOff" {print $1}')

#
kubectl delete pod $(kubectl get pods | awk '$3 == "Error" {print $1}')
```

#### Batch Delete

```sh
kubectl get deployments | \
  grep <text> | \
    awk '{print $1}' | \
      xargs kubectl delete deploy
```

#### Batch Restart

```sh
kubectl get deployments | \
  grep <text> | \
    awk '{print $1}' | \
      xargs kubectl rollout restart deployment
```

<!-- ####

```sh
kubectl patch cronjobs <name> \
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

<!-- ####

```sh
kubectl exec -it \
  <pod> \
  -c <name> \
  -- /bin/bash
``` -->

#### Restart

```sh
#
kubectl rollout restart \
  deployment \
  -n <namespace> \
  <name>

#
kubectl scale deployment \
  --replicas 0 \
  $(kubectl get deployment -l 'app=<appname>' -o jsonpath='{.items[0].metadata.name}' -n <namespace>) \
  -n <namespace>
```

#### Config

```sh
#
kubectl config set-context \
  --current \
  --namespace <namespace>
```

#### Scale

```sh
# Deployment
kubectl scale \
  --replicas=2 \
  -n '<namespace>' \
  deploy/<name>

# ReplicaSet
kubectl scale \
  --replicas=2 \
  -n '<namespace>' \
  rs/<name>
```

#### Edit

```sh
#
kubectl get deploy \
  -n '<namespace>'

kubectl edit \
  -n '<namespace>' \
  deploy/<name>

#
kubectl get hpa \
  -n '<namespace>'

kubectl edit  \
  -n '<namespace>' \
  hpa/<name>
```

<!-- ```sh
kubectl exec -it \
  $(kubectl get pod -l 'app=<appname>' -o jsonpath='{.items[0].metadata.name}' -n <namespace>) \
  -n <namespace> \
  -- /bin/sh -c 'kill 1'
``` -->

<!-- ####

```sh
kubectl get pod <name> -n <namespace> -o yaml | \
  sed 's/restartPolicy: Always/restartPolicy: Never/' | \
    kubectl apply -f -
``` -->

<!-- ####

```sh
#
kubectl proxy --port=8080 &

#
export NS=<namespace>

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
kubectl delete pod <name> \
  --grace-period=0 \
  --force \
  -n <namespace>
```

#### Terminating

##### PVC

```sh
#
kubectl patch pvc <name> \
  -p '{"metadata":{"finalizers":null}}' \
  -n <namespace>

#
kubectl delete pvc <name> \
  -n <namespace> \
  --grace-period 0 \
  --force
```

##### Pod

```sh
#
kubens '<ns-name>'

#
export KUBERNETES_PODE_NAME=''

#
kubectl get pod "$KUBERNETES_PODE_NAME" \
  -o json | \
    jq -r '.metadata.finalizers'

#
kubectl patch pod "$KUBERNETES_PODE_NAME" \
  -p '{"metadata":{"finalizers":[]}}'

#
kubectl delete pod "$KUBERNETES_PODE_NAME" \
  --grace-period 0 \
  --force
```

###### Remove Terminating Pods

```sh
kubectl get pods -A | \
  awk '{if ($4=="Terminating") print "kubectl delete pod " $2 " -n " $1 " --force --grace-period=0 ";}' | \
    sh
```

###### Remove Error Pods

```sh
kubectl get pods -A | \
  awk '{if ($4=="Error") print "kubectl delete pod " $2 " -n " $1 " --force --grace-period=0 ";}' | \
    sh
```

##### Namespace

```sh
for ns in `kubectl get ns --field-selector status.phase=Terminating -o name`; do kubectl patch $ns -p '{"metadata":{"finalizers":[]}}' --type='merge'; done
```

###### API Resources

```sh
for ns in `kubectl get ns --field-selector status.phase=Terminating -o name | cut -d / -f 2`; do for resource in `kubectl api-resources --namespaced -o name --verbs=list | xargs -n 1 kubectl get -o name -n $ns`; do kubectl patch $resource -p '{"metadata": {"finalizers": []}}' --type='merge' -n $ns; done; done
```

<!--
kubectl get namespace "<namespace>" -o json | \
  tr -d "\n" | \
    sed "s/\"finalizers\": \[[^]]\+\]/\"finalizers\": []/" | \
      kubectl replace --raw /api/v1/namespaces/<namespace>/finalize -f -
-->

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
kubectl get cm coredns \
  -n kube-system \
  -o yaml | \
    sed 's/loop/#loop/g' | \
      kubectl apply -f -
``` -->

#### Certificate from Namespace

```sh
kubectl get secret $(kubectl get secrets -n <namespace> | grep 'default-token' | cut -d ' ' -f 1) \
  -o jsonpath='{.data.ca\.crt}' \
  -n <namespace> | \
    base64 -d > ./ca.crt
```

#### Kube Config

##### Read

```sh
# Remote
scp -q '<username>@<hostname>:~/.kube/config' /dev/stdout | yq r -

# Vagrant
vagrant ssh -c 'cat ~/.kube/config'
```

##### Import

```sh
# Remote Host
scp -q '<username>@<hostname>:~/.kube/config' /dev/stdout > /tmp/config

# Vagrant
vagrant ssh -c 'cat ~/.kube/config' | tee /tmp/config
```

```sh
sed -i 's/kubernetes/<new-name>/' /tmp/config
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

#### TBD

```sh
kubectl rollout restart deployment \
  -n <namespace> \
  [...services]
``` -->

### Issues

#### TBD

```log
Warning: resource applications/backstage is missing the kubectl.kubernetes.io/last-applied-configuration annotation which is required by kubectl apply. kubectl apply should only be used on resources created declaratively by either kubectl create --save-config or kubectl apply. The missing annotation will be patched automatically.
```

TODO

#### TBD

```log
Warning  FailedCreatePodSandBox  55s (x13 over 69s)  kubelet            Failed to create pod sandbox: rpc error: code = Unknown desc = failed to start sandbox container for pod "my-app-worker-amqp-system-user-data-import-parser-7b445867xjs6": Error response from daemon: OCI runtime create failed: container_linux.go:349: starting container process caused "process_linux.go:319: getting the final child's pid from pipe caused \"EOF\"": unknown
```

TODO

#### Wrap Columns

```log
error: error parsing STDIN: error converting YAML to JSON: yaml: line [n]: could not find expected ':'
```

Use `base64` with `-w 0`:

```sh
$(echo -n $MY_VAR | base64 -w 0)
```

#### Skip Insecure TLS Verify

```log
Unable to connect to the server: x509: certificate is valid for 10.96.0.1, 172.18.0.3, 0.0.0.0, not 192.168.0.100
```

```sh
#
kubectl get pods -A --insecure-skip-tls-verify

#
kubectl config set-cluster "$(kubectl config current-context)" --insecure-skip-tls-verify=true
```

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

#### Missing Proper JSON Output Format

```log
Unable to connect to the server: getting credentials: decoding stdout: couldn't get version/kind; json parse error: json: cannot unmarshal string into Go value of type struct { APIVersion string "json:\"apiVersion,omitempty\""; Kind string "json:\"kind,omitempty\"" }
```

```sh
#
aws configure set output json
```

<!-- ####

```log
could not get token: NoCredentialProviders: no valid providers in chain. Deprecated.
	For verbose messaging see aws.Config.CredentialsChainVerboseErrors
Unable to connect to the server: getting credentials: exec: executable aws-iam-authenticator failed with exit code 1
```

TODO -->

#### Proxy

```log
proxyconnect tcp: dial tcp <ip>:3128: i/o timeout
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

<!-- ####

```sh
kubectl config set-cluster \
  --certificate-authority=certificate-authority-data \
  --embed-certs=true \
  --server='https://myk8sclust-myresourcegroup-7c08a0mgmt.westeurope.cloudapp.azure.com' azure

kubectl config set-credentials azure \
  --client-certificate=client-certificate-data \
  --client-key=client-key-data \
  --embed-certs=true

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
kubectx <context-name>

#
kubectl get pod -n <namespace>

#
kubectl exec -it \
  $(kubectl get pod -l 'app=<app-name>' -o jsonpath='{.items[0].metadata.name}' -n <namespace>) \
  -n <namespace> \
  -- /bin/sh
```

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
#
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h kubectl \
  -v "$HOME"/.kube/config:/.kube/config \
  --name kubectl \
  --network workbench \
  docker.io/bitnami/kubectl:1.18.15 --help
```
