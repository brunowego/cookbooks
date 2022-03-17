# Toast (react-hot-toast)

## Installation

```sh
# Using Yarn
yarn add react-hot-toast
```

## Configuration

**Refer:** `./src/lib/notification.ts`

```ts
import toast from 'react-hot-toast'

const style = {
  borderRadius: '2px',
  boxShadow: 'none',
}

export default function showToast(message: string, variant: 'success' | 'warning' | 'error') {
  switch (variant) {
    case 'success':
      toast.success(message, {
        duration: 6000,
        style: {
          ...style,
          background: '#333',
          color: '#fff',
        },
      })
      break
    case 'error':
      toast.error(message, {
        duration: 6000,
        style: {
          ...style,
          background: '#FEE2E2',
          color: '#B91C1C',
        },
      })
      break
    case 'warning':
      toast(message, {
        duration: 6000,
        style: {
          ...style,
          background: '#FFEDD5',
          color: '#C2410C',
        },
      })
      break
  }
}
```

**Refer:** `./src/pages/_app.tsx`

```tsx
import type { AppProps } from 'next/app'
import { Toaster } from 'react-hot-toast'

function App({ Component, pageProps }: AppProps) {
  return (
    <>
      <Toaster position="bottom-right" />

      <Component {...pageProps} />
    </>
  )
}

export default App
```

```tsx
// ...
import showToast from '@/lib/notification'

// ...
<button
  className="bg-green-600 py-2 px-5 text-white"
  onClick={() => {
    showToast('Successfully toasted!', 'success')
  }}
>
  Success
</button>
```
