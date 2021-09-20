# Coverage.py

## Links

- [Docs](https://coverage.readthedocs.io/)

## CLI

### Dependencies

- [pytest](/pytest.md)

### Installation

#### pip

```sh
pip3 install coverage
```

### Commands

```sh
coverage help
```

### Configuration

```sh
#
cat << EOF > ./.coveragerc
branch = True
omit =
  */migrations/*
  */apps.py
  */urls.py
  */wsgi.py
EOF

#
cat << EOF >> ./.gitignore
/htmlcov
/.coverage
/.coverage.*
EOF
```

### Usage

```sh
#
coverage erase

#
pytest --cov=./

#
coverage html
```

<!--
coverage run --append `which invoke` app.db.show
-->
