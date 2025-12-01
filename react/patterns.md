# React Patterns

## Compound Components

**Option 1:** Object.assign

```tsx
export default Object.assign(CardRoot, {
  Header: CardHeader,
  // ...
})
```

**Option 2:** Type assertion

```tsx
type CardProps = typeof CardRoot & {
  Header: typeof CardHeader
  // ...
}

const Card = CardRoot as CardProps

Card.Header = CardHeader
// ...

export default Card
```

**Option 3:** Type assertion with Object.assign

```tsx
type CardProps = typeof CardRoot & {
  Header: typeof CardHeader
  // ...
}

const Card = Object.assign(CardRoot, {
  Header: CardHeader,
  // ...
}) satisfies CardProps

export default Card
```

<!--
type PageProps = typeof PageRoot & {
  Group: typeof PageGroup
  Section: typeof PageSection
  Header: typeof PageHeader
  Title: typeof PageTitle
  Description: typeof PageDescription
  Navigation: typeof PageNavigation & {
    Previous: typeof PageNavigationPrevious
    Next: typeof PageNavigationNext
  }
}

const Page = Object.assign(PageRoot, {
  Group: PageGroup,
  Section: PageSection,
  Header: PageHeader,
  Title: PageTitle,
  Description: PageDescription,
  Navigation: Object.assign(PageNavigation, {
    Previous: PageNavigationPrevious,
    Next: PageNavigationNext,
  }),
}) satisfies PageProps

export default Page
-->
