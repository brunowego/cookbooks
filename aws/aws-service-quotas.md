# AWS Service Quotas

## Guides

- [What is Service Quotas?](https://docs.aws.amazon.com/servicequotas/latest/userguide/intro.html)

## CLI

### Commands

```sh
aws service-quotas help
```

### Usage

```sh
#
aws \
  --output table \
  service-quotas list-services

#
aws \
  --output table \
  service-quotas list-service-quotas \
    --service-code 'ec2' \
    --query 'Quotas[*].{ServiceName:ServiceName,QuotaName:QuotaName,QuotaCode:QuotaCode,Value:Value}'

#
aws \
  --output table \
  service-quotas get-service-quota \
    --service-code 'ec2' \
    --quota-code 'L-0263D0A3'

#
aws service-quotas request-service-quota-increase \
  --service-code 'ec2' \
  --quota-code 'L-0263D0A3' \
  --desired-value 10

#
aws service-quotas get-requested-service-quota-change \
  --request-id '[request-id]'

#
aws \
  --output table \
  service-quotas list-requested-service-quota-change-history \
  --query 'RequestedQuotas[*].{CaseId:CaseId,Id:Id,QuotaCode:QuotaCode,QuotaName:QuotaName,DesiredValue:DesiredValue,Status:Status}'

aws \
  --output table \
  service-quotas list-requested-service-quota-change-history-by-quota \
    --service-code 'ec2' \
    --quota-code 'L-0263D0A3' \
    --query 'RequestedQuotas[*].{CaseId:CaseId,Id:Id,QuotaCode:QuotaCode,QuotaName:QuotaName,DesiredValue:DesiredValue,Status:Status}'
```
