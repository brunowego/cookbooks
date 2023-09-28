# Extend with SMTP

## Links

- [Code Repository](https://github.com/minpham-com/medusa-plugin-smtp)
- [Plugin](https://medusajs.com/plugins/medusa-plugin-smtp)

<!--
Subscribers

Invite
Order
Restock
User
-->

## Installation

```sh
# Using Yarn
yarn add medusa-plugin-smtp
```

## Configuration

**Refer:** `./.env`

```env
SMTP_FROM_EMAIL=

# EMAIL_TEMPLATE_PATH=data/emailTemplates
```

**Refer:** `./medusa-config.js`

```js
const plugins = [
  // ...
  {
    resolve: 'medusa-plugin-smtp',
    options: {
      fromEmail: process.env.SMTP_FROM_EMAIL,
      // transport: {
      //   host: 'smtp.gmail.com',
      //   port: 587,
      //   secureConnection: false,
      //   auth: {
      //     user: '<username>@gmail.com',
      //     pass: '<password>',
      //   },
      //   tls: {
      //     ciphers: 'SSLv3',
      //   },
      //   requireTLS: true,
      // },
      // emailTemplatePath: process.env.EMAIL_TEMPLATE_PATH,
      templateMap: {
        'user.password_reset': 'userPasswordReset',
      },
    },
  },
]
```

```sh
#
mkdir -p ./data/emailTemplates/userPasswordReset

#
cat << EOF > ./data/emailTemplates/userPasswordReset/html.pug
code !{JSON.stringify(data)}

p http://localhost:7001/reset-password?token=!{data.token}
EOF

#
cat << EOF > ./data/emailTemplates/userPasswordReset/subject.pug
= 'Reset password'
EOF
```
