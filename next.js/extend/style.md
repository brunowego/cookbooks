# Extend with Style

## Example

```tsx
interface RootLayoutProps {
  // ...
}

export default async function RootLayout({}: // ...
RootLayoutProps): Promise<JSX.Element> {
  // ...

  return (
    <html lang="en" suppressHydrationWarning>
      <head>
        <style nonce={undefined}>{`
          :root {}

          .dark {}
        `}</style>
      </head>
      <body />
    </html>
  )
}
```
