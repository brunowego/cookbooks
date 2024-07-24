# Next.js Routing

## Links

- [Docs](https://nextjs.org/docs/app/building-your-application/routing)

## Snippets

### URL Parameter

```ts
type GetProps = {
  params: { userId: string }
}

export async function GET(_: Request, { params }: GetProps): Promise<Response> {
  // ...
}
```

### Query Parameter

```ts
const url = req.nextUrl.searchParams.get('url')

or

const { searchParams } = new URL(req.url)
const url = searchParams.get('url')
```
