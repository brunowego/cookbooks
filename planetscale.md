# PlanetScale

<!--
https://github.com/planetscale/integrations/tree/main/vercel/nextjs-example
https://github.com/planetscale/beam
-->

**Keywords:** Serverless MySQL

## Links

- [Code Repository](https://github.com/planetscale/cli)
- [Main Website](https://planetscale.com)
- [Vitess](https://planetscale.com/vitess)
- [Dashboard](https://app.planetscale.com)

## CLI

### Links

- [Main Website](https://planetscale.com/cli)

### Dependencies

- [MySQL Client](/mysql/client.md#cli)

### Installation

#### Homebrew

```sh
brew tap planetscale/tap
brew install pscale
```

### Commands

```sh
pscale -h
```

### Configuration

```sh
#
pscale auth login
```

### Usage

```sh
#
pscale database list

#
pscale branch list <db-name>

#
pscale backup list <db-name> <branch-name>

#
pscale database dump <db-name> <branch-name> <backup-id>
```

<!--
#
pscale database create <db-name>

#
pscale branch create <db-name> initial-setup
pscale branch create <db-name> shadow

#
pscale shell <db-name> main
> SHOW TABLES;
> SELECT * FROM _prisma_migrations;

#
pscale connect <db-name> initial-setup --port 3309
pscale connect <db-name> shadow --port 3310

#
pscale deploy-request create <db-name> initial-setup
-->

### Docs

#### Automatically Copy Migration Data

1. "Settings" Tab
2. "General" in Side Menu
3. Check "Automatically copy migration data"
   - Select "Prisma" in "Migration framework"
   - Save database settings
