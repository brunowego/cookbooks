# AWS CloudFront

<!--
https://github.com/theonlyway/react-distributedloadtesting/blob/master/modules/frontend/cloudfront.tf
-->

**Keywords:** CDN, Reverse Proxy

## Alternatives

- Fastly
- Incapsula
- MaxCDN
- Cloudflare

## Solution

### Overview

- Global, Growing Network
- Secure Content at the Edge
- Deep Integration with Key AWS Services
- High Performance
- Cost Effective
- Easy to Use

### Use Cases

- Static Asset Caching
- Live and On-Demand Video Streaming
- Security and DDoS Protection
- Dynamic and Customized Content
- API Acceleration
- Software Distribution

## CLI

### Commands

```sh
aws cloudfront help
```

### Usage

```sh
#
aws \
  --output table \
  cloudfront list-distributions

#
aws \
  --output json \
  cloudfront list-distributions |\
    jq '.DistributionList | .Items | .[] | .Id' |\
      cut -d '"' -f 2
```

<!--
aws cloudfront create-invalidation \
  --distribution-id ${{ secrets.WEBAPP_AWS_CLOUDFRONT_DISTRIBUTION }} \
  --paths "/*"
-->

### Issues

#### TBD

```log
403 ERROR

The request could not be satisfied.

Bad request. We can't connect to the server for this app or website at this time. There might be too much traffic or a configuration error. Try again later, or contact the app or website owner.
If you provide content to customers through CloudFront, you can find steps to troubleshoot and help prevent this error by reviewing the CloudFront documentation.
```

TODO
