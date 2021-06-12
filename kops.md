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
kops get cluster

#
kops create cluster \
  --zones 'us-east-1b,us-east-1c' \
  --admin-access '10.96.0.0/11,0.0.0.0/0' \
  --master-zones 'us-east-1b' \
  --networking 'calico' \
  --kubernetes-version '1.18.15' \
  --master-count 1 \
  --node-count 3 \
  --master-size 't3.large' \
  --node-size 't3.large' \
  --cloud 'aws' \
  --topology 'private' \
  --network-cidr '10.98.0.0/16' \
  --associate-public-ip 'false' \
  --authorization 'RBAC' \
  --ssh-public-key "~/.ssh/id_rsa.${KOPS_CLUSTER_NAME}.pub" \
  --name "$KOPS_CLUSTER_NAME" \
  --cloud-labels "Cluster-Name=${KOPS_CLUSTER_NAME},Squad=SRE,creation-tool=kops"

#
kops validate cluster \
  --name "$KOPS_CLUSTER_NAME"

#
kops export kubecfg --admin
```

<!--
kubectl run nginx --image nginx
kubectl port-forward nginx-[hash] 8080:80
kubectl delete deploy nginx
-->

### Tips

#### Cluster Update

```sh
# Using manually update
kops edit cluster \
  --name "$KOPS_CLUSTER_NAME"

# or, using automatically upgrade
kops upgrade cluster \
  --name "$KOPS_CLUSTER_NAME" \
  --yes

#
kubectl version --short

#
kops update cluster \
  --name "$KOPS_CLUSTER_NAME" \
  --yes

#
kops rolling-update cluster \
  --name "$KOPS_CLUSTER_NAME" \
  --yes

#
kops validate cluster \
  --name "$KOPS_CLUSTER_NAME"
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
kops edit instancegroup \
  --name "$KOPS_CLUSTER_NAME" \
  nodes-us-east-1b

kops edit instancegroup \
  --name "$KOPS_CLUSTER_NAME" \
  nodes-us-east-1c

#
kops update cluster \
  --name "$KOPS_CLUSTER_NAME" \
  --yes

#
kops rolling-update cluster \
  --name "$KOPS_CLUSTER_NAME" \
  --yes

#
kops validate cluster \
  --name "$KOPS_CLUSTER_NAME"
```

#### Deleting Kubernetes Cluster

```sh
#
kops delete cluster \
  --name "$KOPS_CLUSTER_NAME"

#
kops get cluster
```
