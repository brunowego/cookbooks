# Security Vulnerabilities

<!--
https://github.com/dagrz/aws_pwn
https://github.com/globaldatanet/aws-firewall-factory
https://github.com/WithSecureLabs/awspx
https://github.com/projectdiscovery/cloudlist
https://github.com/cloudmarker/cloudmarker
-->

## Related

- [My Arsenal of AWS Security Tools](https://github.com/toniblyx/my-arsenal-of-aws-security-tools)

## Tools

- [Prowler](/prowler.md)

## Common Issues

- Misconfigured access control - S3 Buckets
- Subdomain takeovers - S3/Cloudfront
- Vulnerabilities with apps deployed on computer infrastructure
- Host and network hardening flaws
- Privilege escalation of credentials from computer services
- Do not allow remote desktop access via web, only behind Firewall or VPN

<!--
Security Group
-->

## Security Assessment

### Security Group Check

```sh
for AWS_REGION in $(aws ec2 describe-regions --output text --region 'us-east-1' | cut -f 4)
do
  echo -e "\nListing security groups with any ingress rule with 0.0.0.0/0 in region: '$AWS_REGION'..."
  for AWS_SG_ID in $(aws ec2 describe-security-groups \
    --filter Name=ip-permission.cidr,Values='0.0.0.0/0' \
    --output text \
    --query 'SecurityGroups[*].GroupId' \
    --region "$AWS_REGION" \
    --no-cli-pager)
  do
    echo -e "┌── Security Group ID: $AWS_SG_ID"
    echo -e "├── Open ports: $(aws ec2 describe-security-groups \
      --group-ids "$AWS_SG_ID" \
      --output text \
      --query 'SecurityGroups[].[IpPermissions[?contains(IpRanges[].CidrIp, `0.0.0.0/0`)].[join(`:`, [IpProtocol, join(`-`, [to_string(FromPort), to_string(ToPort)])])][]]' \
      --region "$AWS_REGION" \
      --no-cli-pager)"

    echo -e "└── Instance ID and IP: $(aws ec2 describe-instances \
      --output text \
      --filters Name=instance.group-id,Values="$AWS_SG_ID" \
      --query 'Reservations[].Instances[].[InstanceId,PublicIpAddress]' \
      --region "$AWS_REGION" \
      --no-cli-pager)"
  done
done
```
