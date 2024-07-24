# React Custom Currency

## Snippet

```tsx
import { useState } from 'react'

import Input from './input'
import toCurrency from '../utils/to-currency'

export type CurrencyInputProps = {
  defaultValue?: number
  onChange: (value: number) => void
  currency?: string
  locale?: string
}

export default function CurrencyInput({
  defaultValue = 0,
  onChange,
  locale = 'pt-BR',
  currency = 'BRL',
}: CurrencyInputProps) {
  const [displayValue, setDisplayValue] = useState(
    defaultValue?.toFixed(2).replace(/\D/g, '') || ''
  )
  const numericValue = Number(displayValue) / 100

  const handlePaste = (e: React.ClipboardEvent<HTMLInputElement>) => {
    const numbers = e.clipboardData.getData('text/plain').replace(/\D/g, '')

    if (numbers.trim()) {
      setDisplayValue(numbers)
    }
  }

  const handleKeyDown = (e: React.KeyboardEvent<HTMLInputElement>) => {
    if (e.key === 'Delete' || e.key === 'Backspace') {
      const hasSelection =
        e.currentTarget.selectionStart !== e.currentTarget.selectionEnd

      if (hasSelection) {
        setDisplayValue('')

        return
      }
    }

    if (e.key === 'Backspace') {
      const value = displayValue
        .split('')
        .filter((_, i) => i < displayValue.length - 1)
        .join('')

      setDisplayValue(value)
    }

    if ('0123456789'.includes(e.key)) {
      setDisplayValue(displayValue + e.key)
    }
  }

  return (
    <Input
      inputMode="numeric"
      onChange={(e) => {
        e.preventDefault()
        onChange(numericValue)
      }}
      onKeyDown={handleKeyDown}
      onPaste={handlePaste}
      type="text"
      value={toCurrency(numericValue, { locale, currency })}
    />
  )
}
```

```tsx
<CurrencyInput
  onChange={onChange}
  // placeholder='R$ 0,00'
  defaultValue={value}
/>
```
