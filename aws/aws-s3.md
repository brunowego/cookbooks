# AWS Simple Storage Service (S3)

## Alternatives

- [MinIO](/minio.md)
- Rook

## CLI

### Commands

```sh
aws s3 help
aws s3api help
```

### S3-based Command Sets

#### s3

- Sync file systems
- Stream data
- Transfer large files in multiple parts

#### s3api

- Interact with the AWS API
- Granular control

### Usage

```sh
#
aws s3 ls

# or, using s3api
aws s3api list-buckets

#
aws s3 mb s3://example.com

#
aws s3 ls example.com

#
aws s3api put-bucket-acl \
  --bucket 'example.com' \
  --acl 'public-read'

#
ls

#
aws s3 sync ./ s3://example.com \
  --acl public-read

#
aws s3 website s3://example.com/ \
  --index-document index.html \
  --error-document error.html

#
aws s3api get-bucket-website \
  --bucket 'example.com'

#
aws s3 cp \
  --recursive \
  ./favicon.png \
  s3://example.com/

#
aws s3 rm s3://example.com/favicon.png
```
