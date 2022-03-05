# NextAuth.js GitHub Provider

## Links

- [Docs](https://github.com/nextauthjs/next-auth/blob/main/docs/docs/providers/github.md)

## Configuration

1. GitHub Account -> Settings
2. [Developer settings](https://github.com/settings/developers)
3. Oauth Apps -> Register a new application
   - Application name: My Local App
   - Homepage URL: `http://localhost:3000`
   - Authorization callback URL: `http://localhost:3000/api/auth`
   - Click in Register application
4. Client secrets -> Generate a new client secret
