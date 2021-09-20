# Django Coverage

## References

- [Integration with coverage.py](https://docs.djangoproject.com/en/3.1/topics/testing/advanced/#integration-with-coverage-py)

## Library

### Installation

#### pip

```sh
# As user dependency
pip3 install -U coverage

# As project dependency
echo 'coverage==5.4' >> ./requirements-test.txt

pip3 install \
  -r ./requirements-test.txt \
  -r ./requirements-dev.txt \
  -r ./requirements.txt
```

### Configuration

```sh
# Git ignore
cat << EOF >> >> ~/.gitignore
/.coverage*
/htmlcov
EOF

#
cat << EOF >> ./.coveragerc
[run]
branch = True
source = .
omit =
  .venv/*
  */__init__.py
  */urls.py
  core/admin.py
  core/apps.py
  core/migrations/*
  core/test*.py
  [AppName]/asgi.py
  [AppName]/wsgi.py
  manage.py
EOF
```

### Commands

```sh
coverage help
```

### Usage

```sh
#
coverage run manage.py test
coverage run manage.py test [app-name]

#
coverage report

#
coverage html

# Darwin
open ./htmlcov/index.html

#
coverage erase
```
