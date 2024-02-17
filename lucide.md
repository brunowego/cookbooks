# Lucide

**Keywords:** SVG Icons

## Links

- [Code Repository](https://github.com/lucide-icons/lucide)
- [Main Website](https://lucide.dev)

## Library

### Installation

```sh
# Using pnpm
pnpm add lucide-react

# Using Bun
bun add lucide-react
```

### Tips

#### Icon in Props

```jsx
import { Icons } from '@acme/ui'

interface ComponentProps {
  icon?: keyof typeof Icons
  // ...
}

export function Component({
  icon = 'empty',
  // ...
}: ComponentProps): JSX.Element {
  const Icon = Icons[icon]

  return (
    <>
      <Icon className='w-10 h-10' />

      // ...
    </>
  )
}
```
