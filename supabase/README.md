# Supabase

<!--
"db:start": "supabase start",
"db:stop": "supabase stop",
-->

**Keywords:** Firebase Alternative

## Links

- [Code Repository](https://github.com/supabase/supabase)
- [Main Website](https://supabase.io)
- Dashboard
  - [Projects](https://supabase.com/dashboard/projects)
  - [SQL Editor](https://supabase.com/dashboard/project/_/sql/new)

## Library

### Installation

```sh
# Using Bun
bun add @supabase/supabase-js supabase
```

<!--
@supabase/ssr
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
supabase gen types typescript --local --schema public > types_db.ts
supabase db dump --data-only -f ./seed.sql
supabase db diff | npx supabase migration new
supabase push
supabase pull
-->
