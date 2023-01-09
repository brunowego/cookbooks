# Microsoft SQL Server (MSSQL)

## CLI

### Installation

#### Homebrew

```sh
brew install sqlcmd
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# MSSQL
export PATH="$PATH:/usr/local/opt/sqlcmd/bin"
```

```sh
sudo su - "$USER"
```

### Commands

```sh
sqlcmd --help
```

### Usage

```sh
#
sqlcmd \
  -S 127.0.0.1 \
  -U sa \
  -P '<password>' \
  -Q '<query>'
```

<!--
### Tips

####

sqlcmd -S localhost -U SA -Q "BACKUP DATABASE [demodb] TO DISK = N'/var/opt/mssql/data/demodb.bak' WITH NOFORMAT, NOINIT, NAME = 'demodb-full', SKIP, NOREWIND, NOUNLOAD, STATS = 10"

sqlcmd -S localhost,1433 -U SA -P <<SET_YOUR_PASSWORD>> -i <PATH>\DDL.sql -o <PATH>\output_DDL.txt

sqlcmd -S localhost,1433 -U SA -P <<SET_YOUR_PASSWORD>> -i <PATH>\DML.sql -o <PATH>\output_DML.txt
-->
