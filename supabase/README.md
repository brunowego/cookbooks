# Supabase

**Keywords:** Firebase Alternative, Backend as a Service

<!--
https://hub.docker.com/r/supabase/postgres
https://hub.docker.com/r/supabase/realtime
-->

## Links

- [Code Repository](https://github.com/supabase/supabase)
- [Main Website](https://supabase.io)
- Dashboard
  - [Projects](https://supabase.com/dashboard/projects)
  - [SQL Editor](https://supabase.com/dashboard/project/_/sql/new)

## Learn

- [Supabase VS Custom Backend (Drizzle ORM + Next-Auth V5 + PostgresDB + Storage Service)](https://youtube.com/watch?v=XcZu3aKqedQ)

## Glossary

- Free and Open-Source Software (FOSS)
- Software Development Kit (SDK)

## Library

### Installation

```sh
# Using pnpm
pnpm add @supabase/supabase-js
```

<!--
@supabase/ssr

"db:start": "supabase start",
"db:stop": "supabase stop",
-->

## CLI

### Links

- [Code Repository](https://github.com/supabase/cli)

### Installation

#### Homebrew

```sh
brew tap supabase/tap
brew install supabase
```

### Commands

```sh
supabase -h
```

### Usage

```sh
#
supabase login

#
supabase projects list

#
supabase init

#
supabase start
supabase status
supabase stop
```

<!--
supabase reset
supabase link
supabase gen types typescript --local --schema public > ./types_db.ts
supabase push
supabase pull
-->

### Tips

#### SSL

1. [Select a project to continue](https://supabase.com/dashboard/project/_/settings/database)
2. SSL Configuration -> SSL Certificate -> Download certificate

```sh
#
supabase projects list

#
supabase ssl-enforcement --project-ref <reference-id> get --experimental

#
# SSL is being enforced.
# SSL is *NOT* being enforced.

#
mkdir ~/.postgres

#
cat </path/to/prod-ca-2021.crt> >> ~/.postgres/root.crt

#
DATABASE_URL=postgresql://<username>:<password>@aws-0-us-east-1.pooler.supabase.com:6543/postgres?sslmode=no-verify
```

#### Dump

TODO

<!--
supabase db dump --use-copy --data-only -f ./seed.sql
supabase db dump --role-only -f ./roles.sql
supabase db dump -f ./schema.sql

supabase db diff | npx supabase migration new
-->

### Issues

#### TBD

```log
self-signed certificate in certificate chain
```

TODO

#### TBD

```log
SSL connection is required
```

<!--
JWT verification error: SSL connection is required
-->

<!--
https://github.com/Infisical/infisical/blob/main/backend/src/db/knexfile.ts
-->

<!--
?sslmode=no-verify
-->

TODO

#### TBD

```sh
Unsupported provider: provider is not enabled
```

TODO

#### TBD

```log
@acme/db:db:migrate: error: must be owner of sequence key_key_id_seq
```

TODO
