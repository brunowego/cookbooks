# AWS Simple Notification Service (SNS)

<!--
https://github.com/wri/gfw-aws-core-infrastructure/tree/production/terraform/modules/sns
-->

## Alternatives

- Twilio
- Apache Kafka

## Guides

- [Amazon SNS dead-letter queues (DLQs)](https://docs.aws.amazon.com/sns/latest/dg/sns-dead-letter-queues.html)

## Glossary

- Dead-Letter Queue (DLQ)

## CLI

### Commands

```sh
aws sns help
```

### Usage

```sh
aws \
  --output json \
  sns list-subscriptions
```
