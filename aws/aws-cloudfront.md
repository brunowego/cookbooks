# AWS CloudFront

**Keywords:** CDN

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
