# Google Cloud Platform

## Links

- [Getting Started with kOps on GCE](https://kops.sigs.k8s.io/getting_started/gce/)

<!-- ## State Store

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
export KOPS_STATE_STORE='gs://k8s-kops-state-store'
``` -->

<!-- ## Create Cluster

```sh
# Good pattern [cluster-name]-[region].k8s.local
export KOPS_CLUSTER_NAME='dev01-us-east-1.k8s.local' # prod01, stg01, uat01

#
kops get cluster

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
    --cloud 'gce' \
    --cloud-labels "Cluster-Name=${KOPS_CLUSTER_NAME},Squad=SRE,Creation-Tool=kOps,Environment=Production" \
    --kubernetes-version '1.18.15' \
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

    # --dns-zone kops.example.com

#
kops \
  --name "$KOPS_CLUSTER_NAME" \
  validate cluster

#
kops export kubecfg \
  --admin
``` -->
