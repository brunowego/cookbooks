# AWS Elastic Container Service (ECS)

**Keywords:** Container Orchestration

## Console

- [Clusters](https://console.aws.amazon.com/ecs/v2/clusters)
- [Task definitions](https://console.aws.amazon.com/ecs/v2/task-definitions)

## CLI

### Dependencies

- [AWS Session Manager Plugin](/aws/session-manager-plugin.md)

### Commands

```sh
aws ecs help
```

### Usage

```sh
#
aws ecs list-clusters \
  --output text \
  --query 'clusterArns' \
  --region 'us-east-1'

#
aws ecs list-services \
  --cluster '<cluster-name>' \
  --output text \
  --query 'serviceArns' \
  --region 'us-east-1'

#
aws ecs list-tasks \
  --cluster '<cluster-name>' \
  --output text \
  --query 'taskArns' \
  --region 'us-east-1'

#
aws ecs describe-tasks \
  --cluster '<cluster-name>' \
  --tasks '<task-name>' \
  --region 'us-east-1'
```

<!--
aws ecs list-container-instances \
  --cluster '<cluster-name>' \
  --region 'us-east-1'

aws ecs register-task-definition --cli-input-json file://ecs-task-def-parsed.json

aws ecs list-task-definitions

aws ecs update-service \
  --cluster $(PROJECT_NAME)-$(PROJECT_ENVIRONMENT)-ecs-cluster \
  --service $(PROJECT_NAME)-$(PROJECT_ENVIRONMENT)-app-service \
  --task-definition arn:aws:ecs:$(AWS_REGION):492128005656:task-definition/$(PROJECT_NAME)-$(PROJECT_ENVIRONMENT)-app-task-def
-->

#### Execute Command

```sh
#
aws ecs execute-command \
  --cluster '<cluster-arn>' \
  --container '<container-name>' \
  --command /bin/sh \
  --interactive \
  --task '<task-arn>' \
  --region 'us-east-1'
```

<!--
# Enable Execute Command
aws ecs update-service \
  --service "$AWS_ECS_SERVICE_NAME" \
  --cluster "$AWS_ECS_CLUSTER_NAME" \
  --enable-execute-command
-->

### Tips

#### All Regions Running ECS

```sh
for AWS_REGION in $(aws ec2 describe-regions --output text | cut -f 4)
do
  echo -e "\nListing Clusters in region: '$AWS_REGION'..."
  aws ecs list-clusters \
    --output text \
    --query 'not_null(clusterArns[])' \
    --region "$AWS_REGION" \
    --no-cli-pager
done
```
