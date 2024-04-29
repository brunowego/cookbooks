# Class Variance Authority (cva)

## Links

- [Code Repository](https://github.com/joe-bell/cva)
- [Main Website](https://cva.style)

## Library

### Installation

```sh
# Using pnpm
pnpm add class-variance-authority
```

### Configuration

**Refer:** `./packages/ui/src/components/typography.tsx`

```ts
import { cva } from 'class-variance-authority'

export const typographyVariants = cva('tracking-tight', {
  variants: {
    size: {
      xs: 'text-xs',
      sm: 'text-sm',
      md: 'text-md',
      lg: 'text-lg',
      xl: 'text-xl',
      '2xl': 'text-2xl',
      '3xl': 'text-3xl',
    },
    // weight: {
    //   light: 'font-light',
    //   normal: 'font-normal',
    //   medium: 'font-medium',
    //   semi: 'font-semibold',
    //   bold: 'font-bold',
    //   heading: 'font-extrabold',
    // },
    variant: {
      // primary: 'text-primary',
      // secondary: 'text-secondary',
      muted: 'text-muted-foreground',
      // large: 'font-semibold text-4xl',
      // lead: 'text-muted-foreground text-xl',
      // small: 'font-medium text-sm leading-none',
      header: 'text-lg',
      // accent: 'text-accent',
      h1: 'text-3xl',
      h2: 'text-2xl',
      h3: 'text-xl',
      h4: 'text-lg',
      p: 'text-base',
    },
  },
  defaultVariants: {
    variant: 'p',
  },
  compoundVariants: [
    {
      variant: ['h1', 'h2', 'h3', 'h4'],
      className: 'font-medium',
    },
  ],
})
```
