# Forward Props

## Forwarding props to a child component

```jsx
import { forwardRef, useRef } from 'react'

const Child = forwardRef((props, ref) => {
  return <div ref={ref}>...</div>
})

const Parent = () => {
  const ref = useRef(null)

  return <Child ref={ref} />
}
```
