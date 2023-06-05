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
# Parameterized
mongosh \
  -u root \
  -p root \
  --authenticationDatabase admin \
  mongodb://127.0.0.1:27017

# Single string
mongosh 'mongodb://root:root@127.0.0.1:27017?authSource=admin'

# Without authorization
mongosh 'mongodb://127.0.0.1:27017?authSource=admin'
```

#### Queries

```mongodb
use dev

rs.initiate({ _id: 'rs0', members: [{ _id: 0, host: '127.0.0.1:27017' }] });

rs.status();

db.createUser({user: 'admin', pwd: 'admin', roles: [ { role: 'root', db: 'dev' } ]});

db.tempcollection.find();

exit
```

<!--
rs.reconfig({ _id: 'rs0', members: [{ _id: 0, host: 'localhost:27017' }] }, { force: true })

db.getSiblingDB('admin').auth(
  process.env.MONGO_INITDB_ROOT_USERNAME,
  process.env.MONGO_INITDB_ROOT_PASSWORD
)

db = db.getSiblingDB(_getEnv('MONGO_INITDB_DATABASE'))

db.createUser({
  user: _getEnv('MONGO_USERNAME'),
  pwd: _getEnv('MONGO_PASSWORD'),
  roles: ['readWrite'],
})
-->

<!--
retryWrites=true
w=majority
replicaSet=rs0&readPreference=primary
ssl=false
-->
