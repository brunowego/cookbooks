# Flask sqlacodegen

## CLI

### Installation

#### PIP

```sh
# Only Python 2.x are supported.
pip install -U mysql-python flask-sqlacodegen
```

### Usage

```sh
flask-sqlacodegen \
  'mysql://user:pass@127.0.0.1/dev' \
  --outfile './common/models/model.py'  \
  --flask

flask-sqlacodegen \
  'mysql://user:pass@127.0.0.1/dev' \
  --tables user \
  --outfile './common/models/user.py'  \
  --flask
```
