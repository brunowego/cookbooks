# React Text Format

<!--
https://github.com/react-ninja/react-text-format
https://github.com/s-yadav/react-number-format
-->

## Snippets

```ts
//
const formatter = Intl.NumberFormat('en')
formatter.format(text)

//
const formatter = Intl.NumberFormat('en', { notation: 'compact' })
formatter.format(text)

//
const formatter = new Intl.NumberFormat('en', {
  style: 'currency',
  currency: 'USD',
  maximumFractionDigits: 2,
  minimumFractionDigits: 2,
})
formatter.format(price as number)
```
