# Framer Motion

## Links

- [Code Repository](https://github.com/framer/motion)
- [Main Website](https://framer.com/motion)

## Installation

```sh
# Using NPM
npm install framer-motion

# Using Yarn
yarn add framer-motion
```

## Configuration

```tsx
import { motion } from 'framer-motion'

export default function Page({ children }: Props) {
  return (
    <motion.main
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      exit={{ opacity: 0 }}
      transition={{ type: 'tween', ease: 'anticipate', duration: 0.5 }}
    >
      {children}
    </motion.main>
  )
}
```

## Issues

### TBD

```log
Warning: useLayoutEffect does nothing on the server, because its effect cannot be encoded into the server renderer's output format. This will lead to a mismatch between the initial, non-hydrated UI and the intended UI. To avoid this, useLayoutEffect should only be used in components that render exclusively on the client. See https://reactjs.org/link/uselayouteffect-ssr for common fixes.
```

TODO
