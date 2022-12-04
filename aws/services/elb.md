# AWS Elastic Load Balancing (ELB)

<!--
Application Load Balancer
-->

## CLI

### Commands

```sh
aws elb help
```

### Usage

```sh
#
aws \
  --output json \
  elbv2 describe-load-balancers |
    jq -r '.LoadBalancers[].DNSName'
```
