# Amazon CloudFront

**Keywords:** CDN

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
