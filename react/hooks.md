# React Hooks

<!--
https://app.pluralsight.com/library/courses/using-react-hooks/table-of-contents
https://linkedin.com/learning/react-hooks/understanding-modern-react
-->

## Snippets

### useState

<!--
Mistakes:

- Derived State
-->

```ts
//
interface Filters {
  createdAt?: Date
}

const [filters, setFilters] = useState<Filters>({
  createdAt: undefined,
})

//
const [isModalOpen, setIsModalOpen] = useState<boolean>(false)
```

### useEffect

```ts
//
const analyticsData = { userId: user?.id }

useEffect(() => {
  trackEvent('pageEvent', analyticsData)
}, []) // eslint-disable-line react-hooks/exhaustive-deps

//
const analyticsData = useMemo(() => ({ userId: user?.id }), [user?.id])

useEffect(() => {
  trackEvent('pageEvent', analyticsData)
}, [analyticsData])

//
// useCallback if a function is passed as a dependency

//
const [analyticsData, setAnalyticsData] = useState<AnalyticsData>({
  userId: user?.id,
})

useEffect(() => {
  trackEvent('pageEvent', analyticsData)
}, [])
```

## Issues

### TBD

```log
React Hook useEffect has a missing dependency: '[name]'. Either include it or remove the dependency array.eslint react-hooks/exhaustive-deps
```

TODO
