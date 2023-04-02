# mongosh

**Keywords:** MongoDB CLI

## Links

- [Code Repository](https://github.com/mongodb-js/mongosh)
- [Main Website](https://mongodb.com/try/download/shell)

## CLI

### Installation

#### Homebrew

```sh
brew install mongosh
```

### Commands

```sh
mongosh -h
```

### Usage

```sh
#
mongosh \
  -u root \
  -p root \
  --authenticationDatabase admin \
  mongodb://127.0.0.1:27017

#
mongosh 'mongodb://root:root@127.0.0.1:27017?authSource=admin'

#
mongosh 'mongodb://127.0.0.1:27017?authSource=admin'
```

#### Queries

```mongodb
use dev

rs.status();

db.createUser({user: 'admin', pwd: 'admin', roles: [ { role: 'root', db: 'dev' } ]});

db.tempcollection.find();

exit
```

<!--
retryWrites=true
w=majority
replicaSet=rs0&readPreference=primary
ssl=false
-->
