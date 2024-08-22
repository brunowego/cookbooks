# Convex Auth

## Links

- [Code Repository](https://github.com/get-convex/convex-auth)
- [Main Website](https://convex.dev/auth)
- [Labs](https://labs.convex.dev/auth)
- [Docs](https://docs.convex.dev/auth/convex-auth)

## Library

### Issues

#### Missing ConvexAuthNextjsServerProvider

```log
TypeError: Cannot destructure property 'signIn' of '(0 , _convex_dev_auth_react__WEBPACK_IMPORTED_MODULE_4__.useAuthActions)(...)' as it is undefined.
```

```log
TypeError: Cannot destructure property 'isLoading' of 'useAuth(...)' as it is undefined.
```

Need to add `ConvexAuthNextjsServerProvider` to providers.
