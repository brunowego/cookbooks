# Health Check

**Keywords:** Service Status

## Endpoint Response

```json
{
  "service": "my-service",
  "healthy": true,
  "workload": {
    "healthy": true
  },
  "dependencies": [
    {
      "name": "cassandra",
      "healthy": true
    },
    {
      "name": "another-service",
      "healthy": true
    }
  ]
}
```
