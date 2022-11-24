# AWS Elastic Kubernetes Service (EKS)

<!--
https://www.youtube.com/watch?v=tkYzg8HRK4o
-->

**Keywords:** Kubernetes Orchestration

## Alternatives

- [Kubernetes Operations (kOps)](/kops.md)
- [Rancher](/rancher.md)

## Console

- [Clusters](https://console.aws.amazon.com/eks/home#/clusters)

## Glossary

- Application Load Balancer (ALB)

## CLI

### Commands

```sh
aws eks help
```

### Usage

```sh
#
aws eks list-clusters
```

<!--
#
for CLUSTER in $(aws eks list-clusters | cut -f 2 -d $'\t'); do
  aws eks \
    --region us-east-1 \
    update-kubeconfig \
    --name "$CLUSTER"
done
-->

<!-- ### Tips

#### All Regions Running EKS

```sh
for AWS_REGION in $(aws ec2 describe-regions --output text | cut -f 4)
do
  echo -e "\nListing Clusters in region: '$AWS_REGION'..."
  aws eks list-clusters \
    --output text \
    --query 'not_null(clusters[])' \
    --region "$AWS_REGION" \
    --no-cli-pager
done
``` -->
