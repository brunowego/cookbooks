# AWS Route 53

## Guides

- [Migrating a hosted zone to a different AWS account](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/hosted-zones-migrating.html)

## CLI

### Commands

```sh
aws route53 help
```

### Usage

```sh
#
aws route53
```

<!--
aws route53 list-resource-record-sets --hosted-zone-id Z2LD58HEXAMPLE

aws route53 list-resource-record-sets --hosted-zone-id Z2LD58HEXAMPLE --max-items 1

aws route53 list-resource-record-sets --hosted-zone-id Z2LD58HEXAMPLE --max-items 1 --starting-token Z3M3LMPEXAMPLE

aws route53 list-resource-record-sets --hosted-zone-id Z2LD58HEXAMPLE --query "ResourceRecordSets[?Name == 'example.domain.']"
-->

### Tips

#### Get all DNS records from all Route53 hosted zones

```sh
#
for zone in `aws --output json route53 list-hosted-zones | jq -r '.HostedZones[].Id'`; do \
    aws --output json route53 list-resource-record-sets --hosted-zone-id $zone |\
        jq -r '.ResourceRecordSets[]? | "\(.Name),\(.Type),\(.ResourceRecords[]?.Value)"'; \
done
```

#### Get all dangling DNS records from all Route53 hosted zones

```sh
#
for zone in `aws --output json route53 list-hosted-zones | jq -r '.HostedZones[].Id'`; do
    aws --output json route53 list-resource-record-sets --hosted-zone-id $zone --query "ResourceRecordSets[?Type == 'CNAME']" |\
        jq -r '.[].Name' |\
            while read record; do \
                if [[ $(host $record | grep 'not found') ]]; then \
                    echo $record;
                fi;
            done;
done
```

<!--
aws route53 list-resource-record-sets \
  --hosted-zone-id [hosted-zone-id] \
    > ./[path-to-output-file]
-->

<!--
heritage=external-dns,
external-dns/owner=prod-us-east-1,
external-dns/resource=service/monitoring/prometheus-stack-kube-prom-prometheus

heritage=external-dns,
external-dns/owner=tools-us-east-1,
external-dns/resource=ingress/monitoring/prometheus-stack-grafana
-->
