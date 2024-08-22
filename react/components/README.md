# React Components

## Library

- [Chakra UI](https://chakra-ui.com)
- [Headless UI](https://headlessui.com)
- [Mantine](https://mantine.dev)
- [Material UI (MUI)](https://mui.com)
- [React Spectrum](https://react-spectrum.adobe.com)
- [Tailwind UI](https://tailwindui.com)

<!--
https://getjustd.com | https://github.com/justdlabs/justd
-->

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
