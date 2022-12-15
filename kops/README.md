# Kubernetes Operations (kOps)

**Keywords:** Kubernetes Orchestration

## Links

- [Code Repository](https://github.com/kubernetes/kops)
- [Main Website](https://kops.sigs.k8s.io/)
- [Addons](https://kops.sigs.k8s.io/addons/)

## Docs

- [Compatibility Matrix](https://kops.sigs.k8s.io/welcome/releases/#compatibility-matrix)

## Content

- [Manage Kubernetes Clusters on AWS Using kOps](https://aws.amazon.com/blogs/compute/kubernetes-clusters-aws-kops/)

## Tools

- [asdf kOps](/asdf/asdf-kops.md)

## CLI

### Installation

#### Homebrew

```sh
brew install kops
```

#### Linux Binary

```sh
sudo curl \
  -L "https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64" \
  -o /usr/local/bin/kops && \
    sudo chmod +x /usr/local/bin/kops
```

#### Chocolatey

```sh
choco install kubernetes-kops
```

### Commands

```sh
kops -h
```

### Provisioning

- [Amazon Web Services (AWS)](./cloud-provider/aws.md)
- [Azure](./cloud-provider/azure.md)
- [Google Cloud Platform](./cloud-provider/gcp.md)

### Usage

```sh
#
kops get cluster
```

<!-- ### Environments

```sh
#
export KOPS_FEATURE_FLAGS='Spotinst,SpotinstOcean,SpotinstHybrid'
``` -->

### Tips

#### Export Kubeconfig

```sh
#
kops export kubecfg --admin
kops export kubecfg --admin=24h
kops export kubecfg --admin --kubeconfig ./kubeconfig
```

#### Edit Cluster

```sh
# Good pattern [cluster-name]-[region].k8s.local
export KOPS_CLUSTER_NAME='dev01-us-east-1.k8s.local' # prod01, stg01, uat01

#
kops get \
  --name "$KOPS_CLUSTER_NAME" \
  -o yaml

#
aws s3 cp "$KOPS_STATE_STORE/$KOPS_CLUSTER_NAME/kops-version.txt" -; echo

#
kops edit cluster

#
kops update cluster \
  --admin

#
kops get ig

#
export KOPS_NODE_NAME='nodes-us-east-1a'

#
kops rolling-update cluster \
  --instance-group "$KOPS_NODE_NAME" \
  --validation-timeout 30m \
  --yes

#
kops validate cluster --wait 10m
```

<!-- #### Delete Cluster

```sh
kops delete cluster \
  --name ${CLUSTER_NAME} \
  --state ${STATE}
``` -->

<!-- ####

```sh
kops update cluster \
  --admin \
  --target terraform
``` -->

<!-- ####

```sh
kops \
  --name "$KOPS_CLUSTER_NAME" \
  get cluster \
    -o yaml
``` -->

#### Cluster Queries

```sh
# Get first cluster description
kops get cluster \
  -o json | \
    jq

# Good pattern [cluster-name]-[region].k8s.local
export KOPS_CLUSTER_NAME='dev01-us-east-1.k8s.local' # prod01, stg01, uat01

# Discover network CIDR in use
kops get cluster \
  -o json | \
    jq '.spec.networkCIDR'

# Get Kubernetes version in use
kops get cluster \
  -o json | \
    jq '.spec.kubernetesVersion'
```

#### Cluster Update

```sh
# Using manually update
kops \
  --name "$KOPS_CLUSTER_NAME" \
  edit cluster

# or, using automatically upgrade
kops \
  --name "$KOPS_CLUSTER_NAME" \
  upgrade cluster \
    --yes

#
kubectl version --short

#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  update cluster \
    --admin \
    --yes

#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  rolling-update cluster \
    --yes

#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  validate cluster
```

#### Scaling Kubernetes Cluster

```sh
#
export KOPS_CLUSTER_NAME="$(kops get clusters --output json | jq -r .metadata.name)"

#
kops get instancegroups

#
kops get -o yaml # InstanceGroup name

#
kops get ig

#
export KOPS_NODE_NAME='nodes-us-east-1a'

#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  edit instancegroup \
    "$KOPS_NODE_NAME"

#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  update cluster \
    --admin \
    --yes

#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  rolling-update cluster \
    --yes

#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  validate cluster
```

### Issues

<!-- ####

```log
InstanceGroup	nodes-us-east-1b						InstanceGroup "nodes-us-east-1b" did not have enough nodes 4 vs 16
```

TODO -->

#### Machine Not Joined

```log
I1118 18:00:25.978172   52998 instancegroups.go:508] Cluster did not pass validation, will retry in "30s": machine "i-0033d6e99df674321" has not yet joined cluster.
```

```sh
#
kops get cluster \
  -o json | \
    jq -r '.[].metadata.name'

#
export KOPS_CLUSTER_NAME='dev01-us-east-1.k8s.local'

#
kops get ig

#
export KOPS_NODE_NAME='nodes-us-east-1a'

#
kops rolling-update cluster \
  --cloudonly \
  --instance-group "$KOPS_NODE_NAME" \
  --validation-timeout 30m \
  --yes
```

#### Validation Timeout

```log
master not healthy after update, stopping rolling-update: "error validating cluster after terminating instance: cluster did not validate within a duration of \"15m0s\""
```

```sh
kops rolling-update cluster \
  --instance-group "$KOPS_NODE_NAME" \
  --validation-timeout 30m \
  --yes
```

#### Load Balancer Issue

```log
Validation failed: unexpected error during validation: error listing nodes: Unauthorized
```

```sh
#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  edit cluster
```

```yml
spec:
  api:
    loadBalancer:
      class: Network
```

```sh
#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  update cluster \
    --admin \
    --yes

#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  rolling-update cluster \
    --cloudonly \
    --force \
    --yes
```

#### AWS Authentication

```log
error: You must be logged in to the server (Unauthorized)
```

```sh
#
export KOPS_FEATURE_FLAGS='SpecOverrideFlag'

#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  set cluster \
    spec.authentication.aws={}

# kops \
#   --name "$KOPS_CLUSTER_NAME" \
#   set cluster \
#     spec.kubelet.authenticationTokenWebhook=true

# kops \
#   --name "$KOPS_CLUSTER_NAME" \
#   set cluster \
#     spec.kubelet.authorizationMode=Webhook

#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  update cluster \
    --admin \
    --yes

#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  rolling-update cluster \
    --cloudonly \
    --force \
    --yes
```

<!-- ####

```sh
#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  edit cluster
```

```yml
spec:
  # masterPublicName: ...
  metricsServer:
    enabled: true
    insecure: false
```

```sh
#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  update cluster \
    --admin \
    --yes

#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  rolling-update cluster \
    --cloudonly \
    --force \
    --yes
``` -->

<!-- ####

```log
Validation failed: unexpected error during validation: error listing nodes: Get "https://api-cluster-name-region-k8s--d5mo8j-117e2013bf6dca87.elb.us-east-1.amazonaws.com/api/v1/nodes": x509: certificate is valid for kubernetes, kubernetes.default, kubernetes.default.svc, kubernetes.default.svc.cluster.local, api.cluster-name-region.k8s.local, api.internal.cluster-name-region.k8s.local, api-cluster-name-region-k8s--d5mo8j-1118591128.us-east-1.elb.amazonaws.com, not api-cluster-name-region-k8s--d5mo8j-117e2013bf6dca87.elb.us-east-1.amazonaws.com
``` -->

<!--
kops export kubecfg --name ${CLUSTER_NAME} && \
kops update cluster ${CLUSTER_NAME} \
  --admin \
  --out=. \
  --target=terraform && \
terraform apply -auto-approve && \
kops rolling-update cluster ${CLUSTER_NAME} --cloudonly --force --yes
-->

<!--
kops create ...
...

terraform apply -target=aws_internet_gateway.${CLUSTER_PREFIX}-k8s-local -auto-approve && \
terraform apply -target=aws_elb.api-${CLUSTER_PREFIX}-k8s-local -auto-approve

kops update cluster \
  --admin \
  --out=. \
  --target=terraform

terraform apply -auto-approve && \
kops rolling-update cluster --cloudonly --force --master-interval=1s --node-interval=1s --yes
-->

<!--
#
ssh \
  -i ~/.ssh/id_rsa."$KOPS_CLUSTER_NAME" \
  ubuntu@api."$KOPS_CLUSTER_NAME"
-->
