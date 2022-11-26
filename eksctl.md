# eksctl

**Keywords:** AWS Elastic Kubernetes Service

## Links

- [Code Repository](https://github.com/weaveworks/eksctl)
- [Main Website](https://eksctl.io/)

## CLI

### Installation

#### Homebrew

```sh
brew tap weaveworks/tap
brew install weaveworks/tap/eksctl
```

#### Chocolatey

```sh
choco install -y eksctl
```

### Commands

```sh
eksctl -h
```

### Usage

```sh
#
eksctl info
```

<!--
export AWS_ACCOUNT_ID=`aws sts get-caller-identity --query Account --output text`

eksctl create iamserviceaccount \
  --cluster=$AWS_EKS_CLUSTER_NAME \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --role-name "AmazonEKSLoadBalancerControllerRole" \
  --attach-policy-arn arn:aws:iam::${AWS_ACCOUNT_ID}:policy/AWSLoadBalancerControllerIAMPolicy \
  --override-existing-serviceaccounts \
  --approve

eksctl get iamserviceaccount --cluster $AWS_EKS_CLUSTER_NAME --name aws-load-balancer-controller --namespace kube-system

eksctl delete iamserviceaccount \
  --cluster=$AWS_EKS_CLUSTER_NAME \
  --namespace=kube-system \
  --name=aws-load-balancer-controller
-->
