# AWS Elastic Container Service (ECS)

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
  --output json | \
    jq .clusterArns | \
      grep '"' | \
        cut -d '"' -f 2

#
export AWS_ECS_CLUSTER_NAME=''

#
aws ecs list-services \
  --cluster "$AWS_ECS_CLUSTER_NAME" \
  --output json | \
    jq .serviceArns | \
      grep '"' | \
        cut -d '"' -f 2

#
export AWS_ECS_SERVICE_NAME=''

#
aws ecs list-tasks \
  --cluster "$AWS_ECS_CLUSTER_NAME" \
  --output json | \
    jq .taskArns | \
      grep '"' | \
        cut -d '"' -f 2

#
export AWS_ECS_TASK_NAME=''

#
aws ecs describe-tasks \
    --cluster "$AWS_ECS_CLUSTER_NAME" \
    --tasks "$AWS_ECS_TASK_NAME"

#
aws ecs list-container-instances --cluster "$AWS_ECS_CLUSTER_NAME"

#
aws ecs update-service \
  --service "$AWS_ECS_SERVICE_NAME" \
  --cluster "$AWS_ECS_CLUSTER_NAME" \
  --enable-execute-command

#
aws ecs execute-command \
  --cluster "" \
  --container "" \
  --command /bin/sh \
  --interactive \
  --task ""
```
