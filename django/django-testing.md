# Django Testing

## References

- [pytest-django](https://pytest-django.readthedocs.io/en/latest/)
- [tox](https://tox.readthedocs.io/en/latest/)
- [doctest](https://docs.python.org/3/library/doctest.html)
- [Ghost Inspector](https://ghostinspector.com/)

<!--
https://django-test-plus.readthedocs.io/en/latest/

https://app.pluralsight.com/library/courses/django-testing-security-and-performance/table-of-contents
https://linkedin.com/learning/test-driven-development-in-django/
-->

## Library

### Requirements

- [Django Coverage](/django-coverage.md)

### Installation

#### PIP

```sh
# As user dependency
pip3 install -U pytest pytest-django pytest-cov


# As project dependency
cat << EOF >> ./requirements-test.txt
pytest==6.2.2
pytest-django==4.1.0
pytest-cov==2.11.1
EOF

pip3 install \
  -r ./requirements-test.txt \
  -r ./requirements-dev.txt \
  -r ./requirements.txt
```

### Configuration

```sh
# Git ignore
cat << EOF >> >> ~/.gitignore
/.pytest_cache
EOF

#
cat << EOF >> ./pytest.ini
[pytest]
DJANGO_SETTINGS_MODULE = [AppName].settings
addopts =
  -vv
  -p
  no:warnings
  --cov-report term
  --cov-report html
  --cov=core
testpaths = tests/
python_files = test_*.py
EOF
```

### Commands

```sh
pytest help
```

### Usage

```sh
#
pytest
```
