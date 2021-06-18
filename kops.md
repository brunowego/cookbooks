# Kubernetes Operations (kOps)

<!--
https://www.udemy.com/course/learn-devops-helm-helmfile-kubernetes-deployment/

https://github.com/ryane/kubernetes-aws-vpc-kops-terraform
-->

## Alternatives

- [Amazon Elastic Kubernetes Service (EKS)](/aws/aws-eks.md)
- [Rancher](/rancher.md)

## Links

- [Code Repository](https://github.com/kubernetes/kops)
- [Main Website](https://kops.sigs.k8s.io/)
- [Addons](https://kops.sigs.k8s.io/addons/)

## Content

- [Manage Kubernetes Clusters on AWS Using Kops](https://aws.amazon.com/blogs/compute/kubernetes-clusters-aws-kops/)

## CLI

### Installation

#### Homebrew

```sh
brew install kops
```

#### Binary Linux

```sh
sudo curl \
  -L "https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64" \
  -o /usr/local/bin/kops && \
    sudo chmod +x /usr/local/bin/kops
```

### Commands

```sh
kops -h
```

### Usage

```sh
#
aws s3api create-bucket \
  --bucket 'k8s-kops-state-store' \
  --region 'us-east-1'

#
aws s3api put-bucket-versioning \
  --bucket 'k8s-kops-state-store' \
  --region 'us-east-1' \
  --versioning-configuration 'Status=Enabled'

#
export KOPS_STATE_STORE='s3://k8s-kops-state-store'
# Good pattern [cluster-name]-[region].k8s.local
export KOPS_CLUSTER_NAME='dev01-us-east-1.k8s.local' # prod01, stg01, uat01

#
kops get cluster \
  -o json |
    jq '.[0]'

#
ssh-keygen \
  -q \
  -b 4096 \
  -C '<your-email>' \
  -N '' \
  -t rsa \
  -f ~/.ssh/id_rsa."$KOPS_CLUSTER_NAME"

#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  create cluster \
    --admin-access '10.96.0.0/11,0.0.0.0/0' \
    --associate-public-ip=false \
    --authorization 'RBAC' \
    --cloud 'aws' \
    --cloud-labels "Cluster-Name=${KOPS_CLUSTER_NAME},Squad=SRE,Creation-Tool=kOps,Environment=Production" \
    --kubernetes-version '1.18.15' \
    --master-count 1 \
    --master-size 't3.large' \
    --master-zones 'us-east-1b' \
    --network-cidr '10.99.0.0/16' \
    --networking 'calico' \
    --node-count 3 \
    --node-size 't3.large' \
    --ssh-public-key "${HOME}/.ssh/id_rsa.${KOPS_CLUSTER_NAME}.pub" \
    --topology 'private' \
    --zones 'us-east-1b,us-east-1c'

#


#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  validate cluster

#
kops export kubecfg \
  --admin=24h
```

<!--
kubectl run nginx --image nginx
kubectl port-forward nginx-[hash] 8080:80
kubectl delete deploy nginx
-->

### Tips

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
  -o json |
    jq '.[0]'

# Discover network CIDR in use
kops get cluster \
  -o json | \
    jq '.[].spec.networkCIDR'

# Get Kubernetes version in use
kops get cluster \
  -o json | \
    jq '.[].spec.kubernetesVersion'
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
kops \
  --name "$KOPS_CLUSTER_NAME" \
  edit instancegroup \
    nodes-us-east-1b

kops \
  --name "$KOPS_CLUSTER_NAME" \
  edit instancegroup \
    nodes-us-east-1c

#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  update cluster \
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

#### Deleting Kubernetes Cluster

```sh
#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  delete cluster

#
kops get cluster
```

### Issues

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

#
# kops \
#   --name "$KOPS_CLUSTER_NAME" \
#   set cluster \
#     spec.kubelet.authenticationTokenWebhook=true

#
# kops \
#   --name "$KOPS_CLUSTER_NAME" \
#   set cluster \
#     spec.kubelet.authorizationMode=Webhook

#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  update cluster \
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
