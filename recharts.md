# Recharts

## Links

- [Code Repository](https://github.com/recharts/recharts)
- [Main Website](https://recharts.org)

## Library

### Issues

#### TBD

```log
Warning: XAxis: Support for defaultProps will be removed from function components in a future major release. Use JavaScript default parameters instead.
```

<!--
https://github.com/recharts/recharts/issues/3615
-->

Workaround for `defaultProps` warning:

```ts
const error = console.error

console.error = (...args) => {
  if (/defaultProps/.test(args[0])) return

  error(...args)
}
```
