# Extend with AWS S3

<!--
Provider

https://github.com/perfsee/perfsee/blob/main/packages/platform-server/src/storage/providers/provider.ts
-->

<!--
https://github.com/theopensource-company/playrbase/blob/main/src/app/(api)/api/picture/route.ts
https://github.com/AjStraight619/linktree-clone/blob/main/app/api/upload/route.ts
https://github.com/fkunn1326/aipic/blob/main/pages/api/r2/avatarupload.ts
-->

## Installation

```sh
# Using Bun
bun add @aws-sdk/client-s3
```

## Configuration

**Refer:** `./.env`

```env
AWS_REGION=us-west-2
S3_BUCKET_NAME=
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
```

<!--
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::your-bucket-arn-name/*"
    }
  ]
}
-->
