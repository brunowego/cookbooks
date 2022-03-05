# Next.js Component

## Code

```tsx
interface Props {
  children: JSX.Element | string | JSX.Element[]
  color?: string
  onClick?: () => void
}

export default function Button({ children, color, onClick }: Props) {
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
