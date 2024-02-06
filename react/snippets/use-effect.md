# useEffect

## Snippet

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
