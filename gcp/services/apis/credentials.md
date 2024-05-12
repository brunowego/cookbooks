# Google Cloud APIs & Services Credentials

## Links

- [Console](https://console.cloud.google.com/apis/credentials)

## Issues

### TBD

```log
Google hasn’t verified this app
```

TODO

### TBD

```log
Access blocked: <AppName> has not completed the Google verification process
```

<!--
Error 403: access_denied

Request details: access_type=online response_type=code state=klro63yd7dzrwhb8b9rl3ew74erwn670cuv8l90tadt redirect_uri=http://localhost:3000/api/auth/google/callback client_id=367833509800-c1pns59k40nl2h8398iaot83bl8jajnt.apps.googleusercontent.com scope=https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email openid
-->

<!--
https://stackoverflow.com/questions/75454425/access-blocked-project-has-not-completed-the-google-verification-process
-->

TODO

### TBD

```log
You don't have permission to view OAuth clients. Required permissions: clientauthconfig.clients.list or clientauthconfig.clients.listWithSecrets, and iam.serviceAccounts.list
```

TODO

<!--
Add `owner` role
-->

### TBD

```log
Access blocked: Authorization Error
...
Error 401: invalid_client
```

<!--
NEXTAUTH_URL=http://app.acme.localtest.me:3000
-->

TODO

### Missing Redirect URI Environment Variable

```log
Access blocked: Authorization Error
...
Error 400: invalid_request
```

Missing `GOOGLE_REDIRECT_URI` environment variable.

### Missing Authorized Redirect URIs

```log
Access blocked: This app’s request is invalid
...
Error 400: redirect_uri_mismatch
```

Add "Authorized redirect URIs" in "Client ID for Web application" section.
