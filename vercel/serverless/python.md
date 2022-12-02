# Python Runtime

<!--
https://andrewbaisden.medium.com/how-to-deploy-a-python-flask-app-to-vercel-ff4a63d312f4
-->

## Links

- [Runtime](https://vercel.com/docs/concepts/functions/serverless-functions/runtimes/python)
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
