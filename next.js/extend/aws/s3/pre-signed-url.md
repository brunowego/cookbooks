# Pre-signed URLs

<!--
path:src/app/api path:presigned path:route.ts
-->

## Links

- [Code Repository](https://github.com/aws/aws-sdk-js-v3/tree/main/packages/s3-request-presigner)

## Learn

- [S3 Uploads — Proxies vs Presigned URLs vs Presigned POSTs](https://zaccharles.medium.com/s3-uploads-proxies-vs-presigned-urls-vs-presigned-posts-9661e2b37932)

<!--
PUT

https://github.com/dkast/biztro/blob/main/src/app/api/file/route.ts

https://github.com/bremmdev/pre-signed-url/tree/main
https://github.com/Cal3574/e-commerce-frontend/blob/main/src/app/api/aws/presigned_url/route.ts
https://github.com/adrianmoses/blawgsum-app/blob/main/src/app/api/upload/route.ts
https://github.com/okanay/file-filterer/blob/main/src/app/api/s3-put-url-create/route.tsx
https://github.com/4vinn/br/blob/main/src/app/api/upload/route.ts
https://github.com/leleuvilela/video2post/blob/main/src/app/api/upload/route.ts
https://github.com/shreyaslad/finance/blob/master/src/app/api/upload/route.ts
https://github.com/GaryBackEndElecEng/apibuckettest/blob/main/src/app/api/media/route.tsx
https://github.com/chetansirohi/RAG-LLM/blob/main/src/app/api/upload/route.ts
https://github.com/dkast/cargo/blob/main/src/app/api/file/route.ts
https://github.com/pavanbhaskardev/tailor-book/blob/main/src/app/api/images/presigned-url/route.ts

GET

https://github.com/bombies/greens-restaurant-website/blob/main/src/app/api/s3/url/route.ts
-->

## Installation

```sh
# Using pnpm
pnpm add @aws-sdk/s3-request-presigner
```

## Configuration

**Refer:** `./src/app/api/upload/route.ts`

```ts
import { getSignedUrl } from '@aws-sdk/s3-request-presigner'
import { NextResponse } from 'next/server'

import { generateId } from '@acme/id'

import { s3Client, PutObjectCommand } from '@/lib/s3'

export async function POST(req: Request): Promise<Response> {
  const { filename } = await req.json()

  const fileExtension = filename.split('.').pop()
  const key = `${generateId()}.${fileExtension}`

  try {
    const url = await getSignedUrl(
      s3Client,
      new PutObjectCommand({
        Bucket: process.env.S3_BUCKET_NAME,
        Key: key,
      }),
      { expiresIn: 60 }
    )

    return NextResponse.json({
      url,
      key,
    })
  } catch (err) {
    if (process.env.NODE_ENV === 'development') {
      console.error(err)
    }

    return new Response(null, {
      status: 500,
    })
  }
}
```
