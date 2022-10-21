# AWS Certificate Manager (ACM)

## Links

- [AWS Console / ACM / Certificates](https://console.aws.amazon.com/acm/home?region=us-east-1#/)

## CLI

### Commands

```sh
aws acm help
```

### Usage

```sh
#
aws \
  --output table \
  acm list-certificates

#
aws acm describe-certificate \
  --certificate-arn [arn]
```
