# OAuth

<!--
https://github.com/postmanlabs/postman-app-support/issues/9390
-->

## OAuth Apps

1. Settings -> Developer Settings -> [OAuth Apps](https://github.com/settings/developers)
2. New OAuth App
   - Application name: `Postman`
   - Homepage URL: `https://postman.com`
   - Authorization callback URL: `https://oauth.pstmn.io/v1/callback`
   - Register application
3. Create a new client secret

## Callback

1. Request -> Authorization tab
   - Type: OAuth 2.0
   - Callback URL: `https://oauth.pstmn.io/v1/callback`
   - Auth URL: `https://github.com/login/oauth/authorize`
   - Access Token URL: `https://github.com/login/oauth/access_token`
