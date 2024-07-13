# Next.js Routing

## Links

- [Docs](https://nextjs.org/docs/app/building-your-application/routing)

## Snippets

### GET

```ts
type GetProps = {
  params: { userId: string }
}

export async function GET(_: Request, { params }: GetProps): Promise<Response> {
  // ...
}
```
