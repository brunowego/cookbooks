# PlanetScale

## Links

- [Code Repository](https://github.com/planetscale/cli)
- [Main Website](https://planetscale.com/)
- [CLI](https://planetscale.com/cli)
- [Vitess](https://planetscale.com/vitess)

## CLI

### Dependencies

- [MySQL Client](/mysql/mysql-client.md#cli)

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

### Usage

```sh
#
pscale auth login

#
pscale database create [db-name]
pscale branch create [db-name] initial-setup
pscale branch create [db-name] shadow

#
pscale shell [db-name] main
> SHOW TABLES;
> SELECT * FROM _prisma_migrations;

#
pscale connect [db-name] initial-setup --port 3309
pscale connect [db-name] shadow --port 3310

#
pscale deploy-request create [db-name] initial-setup
```

### Docs

#### Automatically Copy Migration Data

1. "Settings" Tab
2. "General" in Side Menu
3. Check "Automatically copy migration data"
   - Select "Prisma" in "Migration framework"
   - Save database settings
