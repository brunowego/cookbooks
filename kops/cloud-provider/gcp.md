# Google Cloud Platform

## Related

- [CLI](/gcp/README.md#cli)

## Docs

- [Getting Started with kOps on GCE](https://kops.sigs.k8s.io/getting_started/gce/)

## State Store

```sh
#
export ORG_NAME='<org-name>'

#
gsutil mb "gs://${ORG_NAME}-kops-state-store"

#
export KOPS_STATE_STORE="gs://${ORG_NAME}-kops-state-store"
```

## Create Cluster

```sh
# Good pattern <env>.<region>.k8s.local
export KOPS_CLUSTER_NAME='stg.us-central1.k8s.local' # prod, uat
# or, <region>.<org-name>.k8s.local
export KOPS_CLUSTER_NAME='us-central1.<org-name>.k8s.local'

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
gcloud projects list
export GCP_PROJECT='<project-id>'

#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  create cluster \
    --admin-access '10.96.0.0/11,0.0.0.0/0' \
    --associate-public-ip=false \
    --authorization 'RBAC' \
    --cloud 'gce' \
    --cloud-labels "Cluster-Name=${KOPS_CLUSTER_NAME},Squad=SRE,Creation-Tool=kOps,Environment=Production" \
    --kubernetes-version "$KUBERNETES_VERSION" \
    --master-count 1 \
    --master-size 'n1-standard-1' \
    --master-zones 'us-central1-b' \
    --network-cidr '10.99.0.0/16' \
    --networking 'calico' \
    --node-count 3 \
    --node-size 'n1-standard-1' \
    --out ./.devops/terraform \
    --project "$GCP_PROJECT" \
    --ssh-public-key "${HOME}/.ssh/id_rsa.${KOPS_CLUSTER_NAME}.pub" \
    --target terraform \
    --topology 'private' \
    --zones 'us-central1-b,us-central1-c'

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
