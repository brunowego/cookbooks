# Amazon Web Services (AWS)

## Related

- [CLI](/aws/README.md#cli)

## Docs

- [Getting Started with kOps on AWS](https://kops.sigs.k8s.io/getting_started/aws/)

## State Store

```sh
#
export ORG_NAME='<org-name>'
export AWS_REGION='us-east-1'

#
aws s3api create-bucket \
  --bucket "${ORG_NAME}-kops-state-store" \
  --region "$AWS_REGION"

#
aws s3api put-bucket-versioning \
  --bucket "${ORG_NAME}-kops-state-store" \
  --region "$AWS_REGION" \
  --versioning-configuration 'Status=Enabled'

#
export KOPS_STATE_STORE="s3://${ORG_NAME}-kops-state-store"
```

## Create Cluster

```sh
# Good pattern <env>.<region>.k8s.local
export KOPS_CLUSTER_NAME='stg.us-east-1.k8s.local' # prod, uat
# or, <region>.<org-name>.k8s.local
export KOPS_CLUSTER_NAME='us-east-1.<org-name>.k8s.local'

#
ssh-keygen \
  -q \
  -b 4096 \
  -C '<your-email>' \
  -N '' \
  -t rsa \
  -f ~/.ssh/id_rsa."$KOPS_CLUSTER_NAME"

# Using specific Kubernetes version. Kubernetes Releases: https://kubernetes.io/releases/
export KUBERNETES_VERSION='1.24.3'

#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  create cluster \
    --admin-access '10.96.0.0/11,0.0.0.0/0' \
    --associate-public-ip=false \
    --authorization 'RBAC' \
    --cloud 'aws' \
    --cloud-labels "Cluster-Name=${KOPS_CLUSTER_NAME},Squad=SRE,Creation-Tool=kOps,Environment=Production" \
    --kubernetes-version "$KUBERNETES_VERSION" \
    --master-count 1 \
    --master-size 't2.micro' \
    --master-zones 'us-east-1b' \
    --network-cidr '10.99.0.0/16' \
    --networking 'calico' \
    --node-count 3 \
    --node-size 't2.micro' \
    --out ./.devops/terraform \
    --ssh-public-key "${HOME}/.ssh/id_rsa.${KOPS_CLUSTER_NAME}.pub" \
    --target terraform \
    --topology 'private' \
    --zones 'us-east-1b,us-east-1c'

#
kops get cluster

#
cd ./.devops/terraform

#
terraform init

#
terraform plan

#
terraform apply

#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  validate cluster

#
kops export kubecfg \
  --admin
```

<!--
t3a.medium
-->

## Delete Cluster

```sh
#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  delete cluster

#
aws s3api get-bucket-versioning \
  --bucket "${ORG_NAME}-kops-state-store" \
  --region "$AWS_REGION"

#
aws s3api delete-bucket \
  --bucket "${ORG_NAME}-kops-state-store" \
  --region "$AWS_REGION"
```

## Issues

### Bucket Not Empty

```log
An error occurred (BucketNotEmpty) when calling the DeleteBucket operation: The bucket you tried to delete is not empty. You must delete all versions in the bucket.
```

Try [Delete Object Versions](/pypi/boto3.md#delete-object-versions).
