# Extend with Million

## Dependencies

- [Million](/million/README.md)

## Configuration

**Refer:** `./next.config.mjs`

```ts
import million from 'million/compiler'

/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  // ...
}

const millionConfig = {
  auto: true,
}

export default million.next(nextConfig, millionConfig)
```

### With Lint

**Refer:** `./next.config.mjs`

```ts
import MillionLint from '@million/lint'
import million from 'million/compiler'

/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  // ...
}

const millionConfig = {
  auto: true,
}

export default MillionLint.next({ rsc: true })(
  million.next(nextConfig, millionConfig)
)
```
