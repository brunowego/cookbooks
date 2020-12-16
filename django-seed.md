# Django Seed

## Library

### Installation

#### PIP

```sh
# As user dependency
pip install -U django-seed

# As project dependency
echo 'django-seed==0.2.2' >> ./requirements.txt
```

***settings.py***

```py
INSTALLED_APPS = [
    # ...
    'django_seed',
    # ...
]
```

###

```sh
./manage.py seed [appname] --number 15

./manage.py seed [appname] --number 15 --seeder '[Model].[field]' '[value]'

./manage.py seed_[model] --number 15
```
