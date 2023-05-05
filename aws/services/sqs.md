# AWS Simple Queue Service (SQS)

**Keywords:** Messaging System

<!--
https://app.pluralsight.com/library/courses/message-queuing-amazon-sqs/table-of-contents
-->

## Links

- [Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue)

## CLI

### Commands

```sh
aws sqs help
```

### Usage

```sh
#
aws \
  --output json \
  sqs list-queues

#
aws sqs create-queue \
  --queue-name '[queue-name]' \
  --attributes 'FifoQueue=true,ContentBasedDeduplication=true,DeduplicationScope=messageGroup,FifoThroughputLimit=perMessageGroupId'
```
