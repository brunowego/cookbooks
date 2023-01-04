# AWS Elastic Kubernetes Service (EKS)

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

#
aws eks \
  --region us-east-1 \
  get-token \
  --cluster-name '<name>'
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

#### TBD

```log
error: You must be logged in to the server (Unauthorized)
```

TODO

```sh
#
kubectl config view --minify

#
aws eks update-kubeconfig \
  --region us-east-1 \
  --name '<cluster-name>' \
  --role-arn "$(aws sts get-caller-identity --output json | jq -r .Arn)"
```

#### TBD2

```log
An error occurred (AccessDenied) when calling the AssumeRole operation: User: arn:aws:iam::<account-id>:user/<email> is not authorized to perform: sts:AssumeRole on resource: arn:aws:iam::<account-id>:user/<email>
```

TODO

<!--
https://acloudguru.com/blog/engineering/fixing-5-common-aws-iam-errors#:~:text=There%20are%20two%20possible%20causes,account%20is%20not%20configured%20correctly.

https://tickets.dominodatalab.com/hc/en-us/articles/9725997625748-kubectl-An-error-occurred-AccessDenied-when-calling-the-AssumeRole-operation-
-->

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["sts:AssumeRole"],
      "Resource": "arn:aws:iam::user:role/role"
    }
  ]
}
```

#### TBD3

```log
│ Error: error waiting for EKS Node Group (<cluster-name>:extra-20230104120149542000000001) to create: unexpected state 'CREATE_FAILED', wanted target 'ACTIVE'. last error: 1 error occurred:
│ 	* i-0ad9c75ce9592cf12, i-0b4239c6f44875126: NodeCreationFailure: Instances failed to join the kubernetes cluster
```

TODO

#### Wrong Schema in Kube Config

```log
'NoneType' object is not iterable
```

```sh
rm "$HOME"/.kube/config
```
