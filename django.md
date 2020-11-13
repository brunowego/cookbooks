# Django

<!--
https://github.com/goupaz/jobhax/tree/master/ats
https://github.com/YDongY/code_snippets
https://github.com/vintasoftware/
https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-django-application-on-ubuntu-14-04
-->

## Tools

- [Djecrety](https://djecrety.ir/)

## CLI

### References

- [Writing your first Django app, part 1](https://docs.djangoproject.com/en/3.0/intro/tutorial01/)
- [Settings](https://docs.djangoproject.com/en/3.0/ref/settings/)
- [Customize the Django Admin With Python](https://realpython.com/customize-django-admin-python/)
- [Writing custom django-admin commands](https://docs.djangoproject.com/en/3.1/howto/custom-management-commands/)

### Applications

- [Nextcloud App Store](https://github.com/nextcloud/appstore)

### Libraries

- [django-cors-headers](https://github.com/adamchainz/django-cors-headers)
- [django-admin-sortable2](https://django-admin-sortable2.readthedocs.io/en/latest/)
- [django-extensions](https://django-extensions.readthedocs.io/en/latest/)

<!--
django-environ
django-filter
django-graphql-jwt
django-graphql-playground
django-rest-swagger
django-redis
djangorestframework
djangorestframework-jwt
-->

### Dependencies

- [Virtualenv](/virtualenv.md)
- [PostgreSQL](/postgresql.md)

### Installation

#### PIP

```sh
# 2.x
pip install -U django==2.2.17

# 3.x
pip install -U django==3.1.3
```

### Commands

```sh
#
python -m django help

#
django-admin help
```

### Bootstrap

```sh
# Version
python -m django version
```

#### Start Project

```sh
python -m django startproject App ./
```

#### Requirements

```sh
#
cat << EOF >> ./requirements-dev.txt
pydocstyle==4.0.1
pylint==2.4.3
EOF

#
echo 'Django==2.2.16' >> ./requirements.txt

#
pip install \
  -r ./requirements-dev.txt \
  -r ./requirements.txt
```

#### Manage Command

```sh
# Help
./manage.py help

# Check for issues
./manage.py check

# Tests
./manage.py test --failfast
```

#### Migrations

- [Settings - Databases](https://docs.djangoproject.com/en/3.0/ref/settings/#databases)

##### SQLite (Default)

```sh
#
./manage.py showmigrations

#
./manage.py migrate
```

##### MongoDB

- [MongoDB](/mongodb.md#docker)

```sh
#
cat << EOF >> ./requirements.txt
sqlparse==0.2.4
djongo==1.3.3
EOF

#
pip install -r ./requirements.txt
```

Comment or remove `BASE_DIR` variable.

Replace `DATABASES` variable in `./App/settings.py`:

```py
DATABASES = {
    'default': {
        'ENGINE': 'djongo',
        'NAME': 'dev',
        'CLIENT': {
            'host': '127.0.0.1',
            'port': 27017,
            'username': 'user',
            'password': 'pass',
            'authMechanism': 'SCRAM-SHA-1',
        },
    }
}
```

```sh
#
./manage.py showmigrations

#
./manage.py migrate
```

##### PostgreSQL

- [PostgreSQL](/postgresql.md#docker)

```sh
#
echo 'psycopg2-binary==2.8.6' >> ./requirements.txt

#
pip install -r ./requirements.txt
```

Comment or remove `BASE_DIR` variable.

Replace `DATABASES` variable in `./App/settings.py`:

```py
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'dev',
        'USER': 'user',
        'PASSWORD': 'pass',
        'HOST': '127.0.0.1',
        'PORT': '5432',
    }
}
```

```sh
#
./manage.py showmigrations

#
./manage.py migrate
```

#### Create Super User

```sh
./manage.py createsuperuser \
  --username admin \
  --email admin@example.com
```

#### Running

```sh
./manage.py runserver 0.0.0.0:8000
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8000/admin/'
```

### Core Module

```sh
./manage.py startapp core
```

Add to `INSTALLED_APPS` the `core` module in `./App/settings.py`:

```py
INSTALLED_APPS = [
    # ...
    'core',
]
```

#### Models

1. `models.py`
2. `admin.py`

#### Migrations

```sh
#
./manage.py makemigrations core

#
./manage.py migrate
```

#### Fixtures

```sh
#
mkdir -p ./core/fixtures
./manage.py dumpdata core > ./core/fixtures/app.json

#
./manage.py loaddata core
```

#### Running

```sh
./manage.py runserver 0.0.0.0:8000
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8000/admin/'
```

<!-- ### Pools Module

```sh
# Create Application
./manage.py startapp polls

#
cat << EOF > ./polls/views.py
from django.http import HttpResponse


def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")
EOF

#
cat << EOF > ./polls/urls.py
from django.urls import path
from . import views


urlpatterns = [
    path('', views.index, name='index'),
]
EOF

#
cat << EOF > ./app/urls.py
from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path('polls/', include('polls.urls')),
    path('admin/', admin.site.urls),
]
EOF

# Start Server
nohup ./manage.py runserver 0.0.0.0:8000 &

# Tail Server
tail -f ./nohup.out

#
echo -e '[INFO]\thttp://127.0.0.1:8000'
echo -e '[INFO]\thttp://127.0.0.1:8000/admin'

# Stop Server
lsof -i tcp:8000 -t | xargs kill -9

# Flush (Remove Database)
./manage.py flush
``` -->

<!-- #### Migration

```sh
./manage.py makemigrations xxxs
./manage.py sqlmigrate xxxs 0001
``` -->

#### Shell

```sh
./manage.py shell
```

##### DB Shell

```sh
./manage.py dbshell
```

<!-- ### Issues -->

<!-- #### OpenSSL

```log
ERROR: Command errored out with exit status 1: python setup.py egg_info Check the logs for full command output.
```

```sh
export LDFLAGS='-I/usr/local/opt/openssl/include -L/usr/local/opt/openssl/lib'

LDFLAGS="-L$(brew --prefix openssl)/lib" \
  CFLAGS="-I$(brew --prefix openssl)/include" \
  pip install -r ./requirements.txt
``` -->
