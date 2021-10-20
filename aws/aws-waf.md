# AWS Web Application Firewall (WAF)

<!--
https://github.com/NagliNagli/BountyTricks
https://github.com/dfds-frontend/terraform-modules/blob/master/aws/waf/main.tf
https://github.com/yveshwang/paywall/blob/master/owasp.tf
https://github.com/Crown-Commercial-Service/ccs-scale-infrastructure/blob/develop/ccs-scale-infra-shared/terraform/modules/infrastructure/cloudfront/waf.tf

https://github.com/p0pr0ck5/lua-resty-waf

cloudfront
-->

## Alternatives

- [Cloudflare](https://cloudflare.com)
- [FlexProtect (p.k.a. Incapsula)](https://imperva.com/products/flexprotect-plans)
- [pfSense](https://pfsense.org)
- [Wazuh](https://wazuh.com)

## Links

- Console / AWS WAF
  - [Web ACLs](https://console.aws.amazon.com/wafv2/homev2/web-acls?region=us-east-1)
  - [IP sets](https://console.aws.amazon.com/wafv2/homev2/ip-sets?region=us-east-1)
- [AWS WAF Pricing](https://aws.amazon.com/waf/pricing/)
- [AWS WAF FAQs](https://aws.amazon.com/waf/faqs/)

## Guides

- [Creating a rule and adding conditions](https://docs.aws.amazon.com/waf/latest/developerguide/classic-web-acl-rules-creating.html)

## CLI

### Commands

```sh
aws waf help
aws wafv2 help
```

### Usage

```sh
#
aws wafv2 list-web-acls \
  --scope 'REGIONAL' \
  --region 'us-east-1'

#
aws wafv2 get-web-acl \
  --scope 'REGIONAL' \
  --region 'us-east-1' \
  --name [web-acl-name] \
  --id [web-acl-id]
```
