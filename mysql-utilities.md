# MySQL Utilities

## CLI

### Installation

#### Homebrew

```sh
brew install mysql-utilities
```

#### APT

```sh
sudo apt update
sudo apt -y install mysql-utilities
```

#### YUM

```sh
sudo apt check-update
sudo yum -y install mysql-utilities
```

### Commands

```sh
mysqlfrm --help
```

### Examples

####

```sh
mysqlfrm --diagnostic mysql/db_name/ > db_name.sql
```
