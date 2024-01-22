# Conditional Rendering

## Ternary Operator

```jsx
import { useState } from 'react'

const ConditionalRendering = () => {
  return (
    <div>
      <h1>Conditional Rendering</h1>

      {isLogged ? (
        // ...
      ) : (
        // ...
      )}

      {isLogged ? <>...<> : null}
    </div>
  )
}
```
