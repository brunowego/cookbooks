# Amazon Route 53

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
