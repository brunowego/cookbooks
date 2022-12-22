# Django Seed

## Library

### Installation

#### pip

```sh
# As user dependency
pip3 install -U django-seed

# As project dependency
echo 'django-seed==0.2.2' >> ./requirements.txt
```

**_settings.py_**

```py
INSTALLED_APPS = [
    # ...
    'django_seed',
    # ...
]
```

### TBD

```sh
./manage.py seed [appname] --number 15

./manage.py seed [appname] --number 15 --seeder '[Model].[field]' '[value]'

./manage.py seed_[model] --number 15
```
