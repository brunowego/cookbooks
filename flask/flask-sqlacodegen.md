# Flask sqlacodegen

## CLI

### Dependencies

- [Flask SQLAlchemy](/flask-sqlalchemy.md)

### Installation

#### pip

```sh
# MySQL
pip2 install -U pymysql flask-sqlacodegen

# PostgreSQL
pip2 install -U psycopg2-binary flask-sqlacodegen
```

### Usage

```sh
#
mkdir -p ./common/models

# MySQL
flask-sqlacodegen \
  'mysql://[username]:[password]@127.0.0.1/[database]' \
  --outfile './common/models/model.py'  \
  --flask

flask-sqlacodegen \
  'mysql://[username]:[password]@127.0.0.1/[database]' \
  --tables 'user' \
  --outfile './common/models/user.py'  \
  --flask

# PostgreSQL
flask-sqlacodegen \
  'postgresql+psycopg2://[username]:[password]@127.0.0.1/[database]' \
  --schema 'public' \
  --outfile './common/models/model.py'  \
  --flask

flask-sqlacodegen \
  'postgresql+psycopg2://[username]:[password]@127.0.0.1/[database]' \
  --schema 'public' \
  --tables 'user' \
  --outfile './common/models/user.py'  \
  --flask
```
