# Extend with Debug

## Console Error

```ts
// ...

export async function GET(request: Request): Promise<Response> {
  // ...

  try {
    // ...
  } catch (error) {
    process.env.NODE_ENV === 'development' && console.error(error)

    // ...
  }
}
```
