# Vercel Environment

## Learn

- [Exporting Development Environment Variables](https://vercel.com/docs/cli/env#exporting-development-environment-variables)

## Utils

- [Environment Variables](https://vevd.vercel.app)

## Commands

```sh
#
vc env -h
```

## Usage

```sh
#
vc link

#
vc env ls

#
vc env pull ./.env.local
vc env pull ./.env.development.local --environment development
vc env pull ./.env.preview.local --environment preview
vc env pull ./.env.production.local --environment production
```

<!--
curl -X POST "https://api.vercel.com/v9/projects/acme-app/env" \
  -H "Authorization: Bearer <VERCEL_TOKEN>" \
  -H "Content-Type: application/json" \
  -d '{
    "key": "DATABASE_URL",
    "value": "<DATABASE_URL>",
    "target": ["preview"],
    "type": "encrypted",
    "gitBranch": "<GIT_BRANCH>"
  }'
-->
