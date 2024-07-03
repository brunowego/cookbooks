# Drizzle Kit

## Links

- [Code Repository](https://github.com/drizzle-team/drizzle-kit-mirror)

## CLI

### Installation

```sh
# Using NPM
npm install drizzle-kit -g
```

### Commands

```sh
drizzle-kit -h
```

### Usage

```sh
#
drizzle-kit introspect:pg

#
drizzle-kit check
```

### Issues

#### TBD

```log
· You're about to add page_imports_page_id_unique unique constraint to the table, which contains 3 items. If this statement fails, you will receive an error from the database. Do you want to truncate page_imports table?

error: relation "page_imports_page_id_unique" already exists
```

<!--
https://www.answeroverflow.com/m/1195082897359642765
-->

TODO

#### TBD

```log
Invalid input Please specify 'dialect' param in config, either of 'pg', 'mysql' or 'sqlite'
```

<!--
https://github.com/drizzle-team/drizzle-orm/discussions/2203
https://github.com/drizzle-team/drizzle-kit-mirror/issues/392
-->

TODO

<!--
( cd ./packages/db; npx drizzle-kit push )
-->
