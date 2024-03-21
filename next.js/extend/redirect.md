# Extend with Redirect

## Configuraiton

**Refer:** `./page.tsx`

```tsx
import { redirect } from 'next/navigation'

export default function Page(): never {
  return redirect('/')
}
```
