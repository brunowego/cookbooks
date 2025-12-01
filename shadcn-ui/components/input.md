# Input

<!--
https://github.com/openstatusHQ/openstatus/blob/main/packages/ui/src/components/input-with-addons.tsx

https://www.diceui.com/docs/components/segmented-input
-->

## Issues

### TBD

```log
Warning: A component is changing an uncontrolled input to be controlled. This is likely caused by the value changing from undefined to a defined value, which should not happen. Decide between using a controlled or uncontrolled input element for the lifetime of the component. More info: https://reactjs.org/link/controlled-components
```

```tsx
const defaultValues = useMemo(
  () => ({
    username: user?.username ?? '', // Missing `?? ''`
    // ...
  }),
  [user]
)
```
