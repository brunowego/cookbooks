# Snippets

## Links

- [Link](https://nextjs.org/docs/api-reference/next/link)
- [Image](https://nextjs.org/docs/api-reference/next/image)

## Examples

### Link

```tsx
import Link from 'next/link'

return (
  <Link href="https://domain.tld" passHref>
    <a target="_blank" rel="noopener noreferrer">
      Text
    </a>
  </Link>
)
```

### Image

```tsx
import Image from 'next/image'

return (
  <Image
    src="https://assets.domain.tld/images/logomark.svg"
    alt="Company Logomark"
    width={88}
    height={88}
  />
)
```
