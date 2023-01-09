# AWS Elastic Load Balancing (ELB)

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
