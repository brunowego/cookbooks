# AWS Elastic Kubernetes Service (EKS)

<!--
https://www.youtube.com/watch?v=tkYzg8HRK4o
-->

## Alternatives

- [Kubernetes Operations (kOps)](/kops.md)
- [Rancher](/rancher.md)

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

#
for CLUSTER in $(aws eks list-clusters | cut -f 2 -d $'\t'); do
  aws eks \
    --region us-east-1 \
    update-kubeconfig \
    --name "$CLUSTER"
done
```
