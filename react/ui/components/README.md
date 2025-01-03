# React Components

## Blueprint

```tsx
import React from 'react'

interface IProps {
  children: JSX.Element | string | JSX.Element[]
  color?: string
  onClick?: () => void
}

export default function Button({ children, color, onClick }: IProps) {
  return (
    <button
      onClick={onClick}
      className={`${
        color ? color : ''
      } transition-colors py-1 rounded-lg px-4 w-full cursor-pointer flex items-center justify-center`}
    >
      {children}
    </button>
  )
}
```

## Exporting Components

**Option 1:** Object.assign

```tsx
export default Object.assign(CardRoot, {
  Header: CardHeader,
  // ...
})
```

**Option 2:** Type assertion

```tsx
type CardProps = typeof CardRoot & {
  Header: typeof CardHeader
  // ...
}

const Card = CardRoot as CardProps

Card.Header = CardHeader
// ...

export default Card
```

**Option 3:** Type assertion with Object.assign

```tsx
type CardProps = typeof CardRoot & {
  Header: typeof CardHeader
  // ...
}

const Card = Object.assign(CardRoot, {
  Header: CardHeader,
  // ...
}) satisfies CardProps

export default Card
```
