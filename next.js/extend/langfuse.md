# Extend with Langfuse

TODO

<!--
import { registerOTel } from '@vercel/otel'
import { LangfuseExporter } from 'langfuse-vercel'

import env from '@/lib/env/server'

export function register() {
  registerOTel({
    serviceName: 'acme',
    traceExporter: new LangfuseExporter({
      publicKey: env.LANGFUSE_PUBLIC_KEY,
      secretKey: env.LANGFUSE_SECRET_KEY,
      baseUrl: env.LANGFUSE_BASEURL,
      environment: process.env.NODE_ENV,
    }),
  })
}
-->
