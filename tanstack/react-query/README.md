# TanStack Query (f.k.a. React Query)

**Keywords:** Data Fetching, State Management

<!--
path:src/hooks/api/index.ts

https://github.com/bengar-dev/my-snippets/tree/main/front/src/hooks/snippets

https://github.com/prasenjeet-symon/intellectia/blob/main/packages/client/src/hooks/topic.hooks.ts
-->

## Links

- [Code Repository](https://github.com/TanStack/query)
- [Main Website](https://tanstack.com/query)
- [Docs](https://tanstack.com/query/latest/docs/react/overview)

## Library

### Installation

```sh
# Using pnpm
pnpm add @tanstack/query-core @tanstack/react-query @tanstack/react-query-devtools @tanstack/react-query-next-experimental
```

### Snippets

#### useQuery

```ts
#
const { data: user, isLoading: isLoadingUser } = useQuery<User>({
  queryKey: ['user', userId],
  queryFn: () => fetchUser(userId),
  gcTime: 1000 * 60 * 60, // 1 hour
  staleTime: 1000 * 60 * 69, // 1 hour
  enabled: !!userId,
})

#
const { data: products, isLoading: isLoadingProducts } = useQuery<Product[]>({
  queryKey: ['userProducts', userId, filters],
  queryFn: () => fetchUserProducts(userId, filters),
})

#
const {
  data: pools,
  isLoading: isPoolsLoading,
  error: poolsError,
} = usePools({ args: { ids: poolIds } })
```

### Issues

#### TBD

```log
Property '#private' in type 'QueryClient' refers to a different member that cannot be accessed from within type 'QueryClient'.
```

Set `@tanstack/react-query` to version `4.35.7`.

#### TBD

```log
Error: Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:
```

TODO

#### Wrong Version

```log
Attempted import error: 'defaultShouldDehydrateQuery' is not exported from '@tanstack/react-query' (imported as 'defaultShouldDehydrateQuery').
```

Set `@tanstack/react-query` to version `4.35.7`.

#### TBD

```log
Error: (0 , _tanstack_react_query__WEBPACK_IMPORTED_MODULE_0__.useQuery) is not a function
```

TODO

<!--
Missing 'use client'
-->
