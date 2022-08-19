# Python

## Links

- [Runtime](https://vercel.com/docs/runtimes#official-runtimes/python)
- [Advanced Python Usage](https://vercel.com/docs/runtimes#advanced-usage/advanced-python-usage)

## Configuration

**Refer:** `./vercel.json`

```json
{
  "version": 2,
  "builds": [
    {
      "src": "api/main.py",
      "use": "@vercel/python",
      "config": {
        "maxLambdaSize": "15mb",
        "runtime": "python3.9"
      }
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "api/main.py"
    }
  ]
}
```

## Issues

### Missing Source Files

```log
WARN! You defined 1 build that did not match any source files (please ensure they are NOT defined in .vercelignore):
```

Remove in `src` and `dest` the base `/`.
