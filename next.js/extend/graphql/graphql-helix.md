# GraphQL Helix

<!--
typescript-react-apollo
-->

## Dependencies

- [GraphQL](/graphql/README.md#library)
- [GraphQL Helix](/graphql/server/graphql-helix.md#library)
- [http-status-codes](/http-status-codes.md#library)

## Configuration

**Refer:** `./src/pages/api/graphql.ts`

```ts
import { StatusCodes, ReasonPhrases } from 'http-status-codes'
import { ExecutionResult, GraphQLError } from 'graphql'
import { IncomingHttpHeaders } from 'http'
import { NextApiHandler } from 'next'
// import { resolveSession } from '@/utils/sessions'
import {
  shouldRenderGraphiQL,
  renderGraphiQL,
  getGraphQLParameters,
  processRequest,
} from 'graphql-helix'
import { Context, createGraphQLContext } from '@/graphql/builder'
import { schema } from '@/graphql'

function getGraphQLCode(error: Error & { code?: number }) {
  return error?.code ?? error?.name === 'NotFoundError'
    ? StatusCodes.NOT_FOUND
    : null
}

function formatResult(result: ExecutionResult) {
  const formattedResult: ExecutionResult = {
    data: result.data,
  }

  if (result.errors) {
    formattedResult.errors = result.errors.map((error) => {
      return new GraphQLError(
        error.message,
        error.nodes,
        error.source,
        error.positions,
        error.path,
        error.originalError,
        {
          code: getGraphQLCode(error.originalError as any),
          path: (error.originalError as any)?.path,
          ...(error.originalError as any)?.extensions,
        }
      )
    })
  }

  return formattedResult
}

interface GraphQLRequest {
  body?: any
  headers: IncomingHttpHeaders
  method: string
  query: any
}

const handler: NextApiHandler = async (req, res) => {
  // const session = await resolveSession({ req, res })
  const { warmup } = req.query

  if (warmup) return res.status(StatusCodes.OK).json({ status: 'Warmed up!' })

  try {
    const request: GraphQLRequest = {
      headers: req.headers,
      method: req.method ?? 'GET',
      query: req.query,
      body: req.body,
    }

    if (shouldRenderGraphiQL(request)) {
      res.setHeader('Content-Type', 'text/html')
      res.send(renderGraphiQL({ endpoint: '/api/graphql' }))
    } else {
      const { operationName, query, variables } = getGraphQLParameters(request)

      const result = await processRequest<Context>({
        operationName,
        query,
        variables,
        request,
        schema,
        contextFactory: () => createGraphQLContext(req, res /**, session */),
      })

      if (result.type !== 'RESPONSE') {
        throw new Error(`Unsupported response type: "${result.type}"`)
      }

      result.headers.forEach(({ name, value }) => res.setHeader(name, value))

      res.status(result.status)
      res.json(formatResult(result.payload))
    }
  } catch (error: any) {
    // console.log(error)
    res
      .status(StatusCodes.INTERNAL_SERVER_ERROR)
      .json({ message: ReasonPhrases.INTERNAL_SERVER_ERROR })
  }
}

export default handler
```

**Refer:** `./src/graphql/errors.ts`

```ts
export class NotFoundError extends Error {
  code = 'NOT_FOUND'

  constructor(message: string) {
    super(message)

    this.name = 'NotFoundError'
    Object.defineProperty(this, 'name', { value: 'NotFoundError' })
  }
}

export class ValidationError extends Error {
  code = 'VALIDATION'
  extensions: Record<string, Record<string, string>>

  constructor(message: string, properties: Record<string, string>) {
    super(message)

    this.name = 'Validation'
    Object.defineProperty(this, 'name', { value: 'Validation' })

    this.extensions = {
      properties,
    }
  }
}
```

**Refer:** `./src/graphql/index.ts`

```ts
import { builder } from './builder'
import { GraphQLSchema, printSchema, lexicographicSortSchema } from 'graphql'
import path from 'path'
import fs from 'fs'
import { IS_DEVELOPMENT } from '@/constants'

export const schema = builder.toSchema({})

function writeSchema(schema: GraphQLSchema) {
  const schemaAsString = printSchema(lexicographicSortSchema(schema))
  const schemaPath = path.join(process.cwd(), 'src/graphql/schema.graphql')

  const existingSchema =
    fs.existsSync(schemaPath) && fs.readFileSync(schemaPath, 'utf-8')

  if (existingSchema !== schemaAsString) {
    fs.writeFileSync(schemaPath, schemaAsString)
  }
}

if (IS_DEVELOPMENT) {
  writeSchema(schema)
}
```

**Refer:** `./src/graphql/builder.ts`

- [GiraphQL](/giraphql/README.md#library)
