# Use Case Pattern

<!--
https://github.com/search?q=path%3Apackages%2F+path%3Ause-case+path%3Auser+path%3A.ts+content%3Aexecute&type=code

https://github.com/search?q=path%3Apackages%2F+path%3Ause-case+path%3A.ts+content%3Aexecute+content%3Arepository&type=code
-->

<!--
Safe Action

https://github.com/celsopires1999/service-agreement/blob/main/src/actions/deleteServiceSystemAction.ts
https://github.com/celsopires1999/service-agreement/blob/main/src/actions/deleteUserListAction.ts
https://github.com/subhanmahmood/subhaniov2/blob/main/src/server/actions/link.actions.ts
https://github.com/remcostoeten/next-drizzle-lucia-sqlite-template/blob/master/src/core/server/actions/auth/sign-in-action.ts
-->

<!--
https://github.com/carlosazaustre/kata-users-ts

https://github.com/kaufon/Pet-Lovers/tree/main/packages/core/src/use-cases
https://github.com/CtrI-Alt-Del/stocker/blob/main/packages/core/src/use-cases/users/index.ts
https://github.com/DeveloperParana/devmx/tree/main/packages/account/domain/src/server/use-cases
https://github.com/classmethod/niseline/tree/main/packages/server/src/component/user
https://github.com/Raphico/product-feedback-app/tree/main/packages/server/src/modules/users
https://github.com/Stack-Learner/one-codebase-many-interfaces/tree/main/packages/core/src/use-cases
https://github.com/smhmayboudi/hono-poc/tree/main/packages/backend/src/domain/user-poc/application/use-case
-->

## Learn

- [Clean Architecture: Use Cases](https://nanosoft.co.za/blog/post/clean-architecture-use-cases)
- [UseCase Red Flags and Best Practices in Clean Architecture](https://engineering.teknasyon.com/usecase-red-flags-and-best-practices-in-clean-architecture-76e2f6d921eb)

## Derived From

- Clean Architecture (Robert C. Martin)
- Domain-Driven Design (DDD) (Eric Evans)
- Hexagonal Architecture / Onion Architecture

## Snippet

### Schemas

```ts
import { z } from 'zod'

export const CreateUserInputSchema = z.object({
  email: z.string().email(),
  name: z.string().min(1),
})

export type CreateUserInput = z.infer<typeof CreateUserInputSchema>

export const UserEntitySchema = z.object({
  id: z.string().uuid(),
  email: z.string().email(),
  name: z.string(),
})

export type UserEntity = z.infer<typeof UserEntitySchema>
```

### Repository Layer

```ts
import { eq } from 'drizzle-orm'

import { db, users } from '@acme/db'

import { CreateUserInput, UserEntity, UserEntitySchema } from './schemas'

export class UserRepository {
  constructor(private readonly dbClient: typeof db) {}

  async findByEmail(email: string): Promise<UserEntity | null> {
    const result = await this.dbClient
      .select()
      .from(users)
      .where(eq(users.email, email))
      .limit(1)

    if (result.length === 0) {
      return null
    }

    return UserEntitySchema.parse(result[0])
  }

  async create(data: CreateUserInput): Promise<UserEntity> {
    const [inserted] = await this.dbClient
      .insert(users)
      .values(data)
      .returning()

    return UserEntitySchema.parse(inserted)
  }
}
```

### Use Case (Business Layer)

```ts
export class CreateUserUseCase {
  constructor(private readonly userRepository: UserRepository) {}

  async execute(rawInput: unknown) {
    const input = CreateUserInputSchema.parse(rawInput)

    const existing = await this.userRepository.findByEmail(input.email)

    if (existing) {
      throw new Error('Email already in use')
    }

    return await this.userRepository.create(input)
  }
}
```

## Structure

```txt
packages/
  business/
    use-cases/
      users/
        create-user-use-case.ts
      bookings/
        create-booking-use-case.ts
    repositories/
      user-repository.ts
      booking-repository.ts
```
