# Clerk

**Keywords:** Authentication (authn), Identity Provider

## Links

- [Org. Repository](https://github.com/clerkinc)
- [Main Website](https://clerk.com)
- [Dashboard](https://dashboard.clerk.com)
- [Status Page](https://status.clerk.com)
- [Social connections (authentication providers)](https://clerk.com/docs/authentication/social-connections/overview)

## Tips

### Get Token from Browser Console

```ts
//
const token = await window.Clerk.session.getToken()

//
copy(token)

//
console.log(token)
```
