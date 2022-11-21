# AWS Simple Storage Service (S3)

## Console

- [Buckets](https://s3.console.aws.amazon.com/s3/buckets)

## Alternatives

- [MinIO](/minio.md)
- Rook

## Guides

- [I'm using the Amazon S3 static website feature but getting an Access Denied error. Why is this happening?](https://aws.amazon.com/premiumsupport/knowledge-center/s3-static-website-endpoint-error/)
- [How can I provide cross-account access to objects that are in Amazon S3 buckets?](https://aws.amazon.com/premiumsupport/knowledge-center/cross-account-access-s3/)

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

<!--
aws s3 sync s3://ORIGIN-BUCKET-NAME s3://DESTINATION-BUCKET-NAME/OPTIONAL-FOLDER \
  --source-region ORIGIN-REGION \
  --region DESTINATION-REGION
-->

<!--
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid":"PublicReadGetObject",
			"Principal": "*",
			"Effect":"Allow",
			"Action":["s3:GetObject"],
			"Resource":["arn:aws:s3:::example-bucket/*"]
		}
	]
}
-->

### Tips

#### Bucket Sync

```sh
#
aws s3 ls s3://<source>
aws s3 ls s3://<target>

#
aws s3 sync s3://<source> s3://<target>
```
