# Pre-signed POST

<!--
https://github.com/AityInc/SampleProjectVersion1/blob/master/src/app/api/pre-signed/route.ts
https://github.com/hamletmaharjan/lostnfound/blob/dev/src/app/api/upload/route.ts
https://github.com/xalbd/taskbruin/blob/main/src/app/api/upload/route.ts
https://github.com/evankirkiles/cpsc419-yale-universed/blob/main/src/app/api/upload/route.tsx
https://github.com/airburst/gallery/blob/main/src/app/api/upload/route.ts
https://github.com/yagoandrade/echosafe-frontend/blob/main/src/app/api/upload/route.ts
-->

## Links

- [Code Repository](https://github.com/aws/aws-sdk-js-v3/tree/main/packages/s3-presigned-post)

## Installation

```sh
# Using pnpm
pnpm add @aws-sdk/s3-presigned-post
```

## Configuration

**Refer:** `./src/app/api/upload/route.ts`

```ts
import { createPresignedPost } from '@aws-sdk/s3-presigned-post'
import { NextResponse } from 'next/server'

import { generateId } from '@acme/id'

import { s3Client } from '@/lib/s3'

export async function POST(req: Request): Promise<Response> {
  const { filename, contentType } = await req.json()

  const fileExtension = filename.split('.').pop()
  const key = `${generateId()}.${fileExtension}`

  try {
    const { url, fields } = await createPresignedPost(s3Client, {
      Bucket: process.env.S3_BUCKET_NAME as string,
      Key: key,
      Conditions: [
        ['content-length-range', 0, 5242880], // 5MB
        ['starts-with', '$Content-Type', contentType],
      ],
      Fields: {
        acl: 'public-read',
        'Content-Type': contentType,
      },
      Expires: 600,
    })

    return NextResponse.json({
      url,
      fields,
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
