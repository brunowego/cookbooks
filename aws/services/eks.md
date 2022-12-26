# AWS Elastic Kubernetes Service (EKS)

<!--
https://github.com/commitdev/terraform-aws-zero/tree/main/modules
https://github.com/brayest/argocd-example/tree/main/modules
https://github.com/chi07/terraform-aws-multiple-environments/tree/master/modules
https://github.com/sobankhan12/eks-testing/tree/master/modules
https://github.com/izner32/aws-iac-terraform/tree/master/modules
https://github.com/maheshglm/aws-infra/tree/main/modules
https://github.com/skamalj/aws-terraform/tree/master/modules
https://github.com/arenaml/arena-terraform/tree/master/modules
https://github.com/sungjunyoung/terraform/tree/master/modules
https://github.com/sandeept1986/terraform-aws/tree/Master/Modules
https://github.com/zeabix-cloud-native/nocnoc-iac/tree/main/modules
https://github.com/tjrohweder/terraform-aws/tree/master/modules
https://github.com/alexey-berdyugin/opsfleet-test-terraform/tree/master/modules
https://github.com/ragul28/gitlab-runner-k8s/tree/master/modules
-->

**Keywords:** Kubernetes Orchestration, Control Plane

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
aws eks list-clusters --region us-east-1

#
aws eks \
  --region us-east-1 \
  update-kubeconfig \
  --name '<cluster-name>'
```

### Tips

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
```

<!-- #### Add All Clusters to Kube Config

```sh
#
for CLUSTER in $(aws eks list-clusters --region us-east-1 | cut -f 2 -d $'\t'); do
  aws eks \
    --region us-east-1 \
    update-kubeconfig \
    --name "$CLUSTER"
done
``` -->

### Issues

#### Wrong Schema in Kube Config

```log
'NoneType' object is not iterable
```

```sh
rm "$HOME"/.kube/config
```
