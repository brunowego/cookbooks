# Django Extensions

## Library

### Installation

#### PIP

```sh
# As user dependency
pip install -U django-extensions pygraphviz

# As project dependency
echo 'django-extensions==3.0.9' >> ./requirements.txt

cat << EOF >> ./requirements-dev.txt
pygraphviz==1.6
notebook==6.1.5
Werkzeug==1.0.1
EOF
```

Add `django_extensions` to your `INSTALLED_APPS` setting.

```py
INSTALLED_APPS = [
    # ...
    'django_extensions',
]
```

### Usage

```sh
#
./manage.py graph_models -h

./manage.py graph_models \
  -a \
  -o ./models.png

# Darwin
open ./models.png

#
./manage.py show_urls

#
./manage.py validate_templates

#
./manage.py shell_plus -h

./manage.py shell_plus

./manage.py shell_plus --notebook

#
./manage.py runserver_plus
```

### Issues

#### Graphviz

```log
CommandError: Neither pygraphviz nor pydotplus could be found to generate the image. To generate text output, use the --json or --dot options.
```

Install [Graphviz](/graphviz.md)