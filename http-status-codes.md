# http-status-codes

## Links

- [Code Repository](https://github.com/prettymuchbryce/http-status-codes)
- [Codes](https://github.com/prettymuchbryce/http-status-codes#codes)

## Library

### Installation

```sh
# Using NPM
npm install http-status-codes

# Using Yarn
yarn add http-status-codes

# Usong pnpm
pnpm add http-status-codes
```

### Snippet (Next.js)

```ts
import { StatusCodes } from 'http-status-codes'

return new NextResponse('Unauthorized', {
  status: StatusCodes.UNAUTHORIZED,
})
```
