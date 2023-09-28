# Extend with Redis

## Links

- [Docs](https://docs.medusajs.com/development/cache/modules/redis)

## Configuration

**Refer:** `./.env` (Medusa)

```env
REDIS_HOST=127.0.0.1
REDIS_PORT=6379
REDIS_URL=redis://$REDIS_HOST:$REDIS_PORT
```

## Event Bus

### Links

- [Docs](https://docs.medusajs.com/development/events/modules/redis)

### Configuration

**Refer:** `./medusa-config.js`

```js
// ...
const modules = {
  ventBus: {
    resolve: '@medusajs/event-bus-redis',
    options: {
      redisUrl: REDIS_URL,
    },
  },
  // ...
}
```

## Cache Service

**Refer:** `./medusa-config.js`

```js
// ...
const modules = {
  // ...
  cacheService: {
    resolve: '@medusajs/cache-redis',
    options: {
      redisUrl: REDIS_URL,
    },
  },
}

// ...
const projectConfig = {
  // ...
  redis_url: REDIS_URL,
}
```

## Issues

### TBD

```log
warn:    Local Event Bus installed. This is not recommended for production.
```

TODO
