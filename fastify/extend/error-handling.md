# Fastify Error Handling

<!--
https://github.com/paulschwoerer/leafplayer/tree/main/lib/errors

Good Pattern

https://github.com/Eyevinn/live-encoding/blob/main/src/api/errors.ts
https://github.com/adrian-afl/oop-to-fn-experiment-blog-result/blob/main/api.ts
https://github.com/Vicente-Labs/migos-api/blob/main/src/http/error-handler.ts
https://github.com/digidem/mapeo-map-server/blob/master/src/api/errors.ts
-->

## Links

- [Docs](https://fastify.dev/docs/latest/Reference/Errors)

## Snippets

```ts
// userRepository.ts

async function findById(id: string) {
  return knex('users').where({ id }).first()
}

// userService.ts

async function getUserById(id: string) {
  const user = await userRepository.findById(id)

  if (!user) {
    throw new NotFoundError('User not found.')
  }

  return user
}

// userRoutes.ts

fastify.get('/users/:id', async (request, reply) => {
  try {
    const user = await userService.getUserById(request.params.id)

    return reply.send(user)
  } catch (err) {
    if (err instanceof NotFoundError) {
      return reply.status(404).send({ message: err.message })
    }

    request.log.error(err)

    return reply.status(500).send({ message: 'Internal Server Error' })
  }
})

// Handlers

export class NotFoundError extends Error {
  constructor(message: string) {
    super(message)
    this.name = 'NotFoundError'
  }
}
```
