# Extend with SendGrid

## Links

- [Docs](https://docs.medusajs.com/plugins/notifications/sendgrid)

## Dependencies

- [SendGrid](/twilio/sendgrid.md)

## Installation

```sh
# Using Yarn
yarn add medusa-plugin-sendgrid
```

## Configuration

**Refer:** `./.env`

```env
SENDGRID_API_KEY=SG.{...}
SENDGRID_FROM=
SENDGRID_USER_PASSWORD_RESET_ID=d-{...}
```

**Refer:** `./medusa-config.js`

```js
const plugins = [
  // ...
  {
    resolve: 'medusa-plugin-sendgrid',
    options: {
      api_key: process.env.SENDGRID_API_KEY,
      from: process.env.SENDGRID_FROM,
      user_password_reset_template: process.env.SENDGRID_USER_PASSWORD_RESET_ID,
    },
  },
]
```

## Templates

### User Invite

**Refer:** `./src/subscribers/invite.ts`

```ts
import { EventBusService } from '@medusajs/medusa'

type InjectedDependencies = {
  eventBusService: EventBusService
  sendgridService: any
}

class InviteSubscriber {
  protected sendgridService: any

  constructor({ eventBusService, sendgridService }: InjectedDependencies) {
    this.sendgridService = sendgridService

    eventBusService.subscribe('invite.created', this.handleInvite)
  }

  handleInvite = async (data: Record<string, any>) => {
    this.sendgridService.sendEmail({
      templateId: process.env.SENDGRID_INVITE_CREATED_ID,
      from: process.env.SENDGRID_FROM,
      to: data.user_email,
      dynamic_template_data: { dynamic: 'data' },
    })
  }
}

export default InviteSubscriber
```

## Issues

### TBD

```log
warn:    You don't have any notification provider plugins installed. You may want to add one to your project.
```
