# Extend with Vercel

## Issues

### Connection is Insecure

```log
error: connection is insecure (try using `sslmode=require`)
```

```env
DATABASE_URL=postgres://<username>:<password>@<hostname>:5432/<database>?ssl=true
```
