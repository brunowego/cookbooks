# Next.js Types

## Code

**Refer:** `./src/types/index.d.ts`

```ts
import { UserRole } from '@/constants'

export interface AuthInterface {
  role?: UserRole;
  authenticatedRedirect?: string;
  children?: any;
  ScreenLoader?: React.ReactNode;
}
```

**Refer:** `./src/types/User.ts`

```ts
export default interface IUser {
  name: string;
  email: string;
}
```
