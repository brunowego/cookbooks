# Snippets

## Links

- [Link](https://nextjs.org/docs/api-reference/next/link)
- [Image](https://nextjs.org/docs/api-reference/next/image)

## Examples

### Link

```tsx
import Link from 'next/link'

return (
  <Link href="https://example.com" passHref>
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
    src="https://assets.example.com/images/logomark.svg"
    alt="Company Logomark"
    width={88}
    height={88}
  />
)
```
