# Django

<!--
https://app.pluralsight.com/library/courses/django-testing-security-and-performance/table-of-contents

https://aalvarez.me/posts/custom-admin-action-buttons-in-django/
https://stackoverflow.com/questions/64689978/django-connectionreseterror-errno-54

https://github.com/pixelpassion/django-saas-boilerplate/
https://app.pluralsight.com/paths/skill/building-web-applications-with-django

https://app.pluralsight.com/library/courses/django-admin/table-of-contents
https://app.pluralsight.com/library/courses/django-forms-and-modelforms/table-of-contents
https://app.pluralsight.com/library/courses/django-views-apps-url-mappings/table-of-contents
https://app.pluralsight.com/library/courses/django-templates/table-of-contents
https://app.pluralsight.com/library/courses/django-getting-started/table-of-contents
https://app.pluralsight.com/library/courses/django-fundamentals-update/table-of-contents

https://www.willandskill.se/en/custom-django-admin-actions-with-an-intermediate-page/
https://blogs.harvard.edu/rprasad/tag/django-admin/
https://code4startup.com/projects/uber-app-for-food-with-python-django-and-swift
https://github.com/goupaz/jobhax/tree/master/ats
https://github.com/YDongY/code_snippets
https://github.com/vintasoftware/
https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-django-application-on-ubuntu-14-04
https://linevi.ch/en/django-inline-in-fieldset.html
https://www.linkedin.com/learning/securing-django-applications/security-and-django

https://django.readthedocs.io/en/stable/ref/contrib/admin/actions.html

https://github.com/bfirsh/django-ordered-model
-->

## Tools

- [Djecrety](https://djecrety.ir/)

## CLI

### Tools

- [Sentry](https://sentry.io/for/django/)

### References

- [Django Web Framework (Python)](https://developer.mozilla.org/en-US/docs/Learn/Server-side/Django/Introduction)
- [Managing static files (e.g. images, JavaScript, CSS)](https://docs.djangoproject.com/en/2.2/howto/static-files/#managing-static-files-e-g-images-javascript-css)
- [Writing your first Django app, part 1](https://docs.djangoproject.com/en/3.0/intro/tutorial01/)
- [Settings](https://docs.djangoproject.com/en/3.0/ref/settings/)
- [Customize the Django Admin With Python](https://realpython.com/customize-django-admin-python/)
- [Writing custom django-admin commands](https://docs.djangoproject.com/en/3.1/howto/custom-management-commands/)
- [Django ORM Relationships Cheat Sheet](https://hackernoon.com/django-orm-relationships-cheat-sheet-14433d6cf68c)

### Applications

- [Nextcloud App Store](https://github.com/nextcloud/appstore)

### Libraries

- [django-admin-sortable2](https://django-admin-sortable2.readthedocs.io/en/latest/)
- [django-cors-headers](https://github.com/adamchainz/django-cors-headers)
- [django-environ](https://django-environ.readthedocs.io/en/latest/)
- [django-extensions](https://django-extensions.readthedocs.io/en/latest/)
- [django-q](https://django-q.readthedocs.io/en/latest/)

<!--
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

# 2.x
echo 'Django==2.2.17' >> ./requirements.txt

# 3.x
echo 'Django==3.1.3' >> ./requirements.txt

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

DJANGO_ENV=production ./manage.py check --deploy

# Tests
./manage.py test --failfast
```

#### Migrations

- [Settings - Databases](https://docs.djangoproject.com/en/3.0/ref/settings/#databases)

##### SQLite (Default)

Native.

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
            'host': 'mongodb',
            'port': 27017,
            'username': 'user',
            'password': 'pass',
            'authMechanism': 'SCRAM-SHA-1',
        },
    }
}
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
        'HOST': 'postgresql',
        'PORT': '5432',
    }
}
```

#### Migrate

```sh
#
./manage.py showmigrations

#
./manage.py migrate
```

#### Create Super User

```sh
# 2.x
./manage.py createsuperuser \
  --username admin \
  --email admin@example.com

# 3.x
DJANGO_SUPERUSER_PASSWORD='Pa$$w0rd!' ./manage.py createsuperuser \
  --no-input \
  --username admin \
  --email admin@example.com
```

#### Running

```sh
#
./manage.py runserver 0.0.0.0:8000

#
uwsgi --ini ./uwsgi.ini
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8000/admin/'
```

### Core Module

```sh
./manage.py startapp core
```

Add to `PROJECT_APPS` the `core` module in `./App/settings.py`:

```py
DJANGO_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
]

THIRD_PARTY_APPS = [
    # ...
]

PROJECT_APPS = [
    # ...
    'core.apps.CoreConfig',
]

INSTALLED_APPS = DJANGO_APPS + PROJECT_APPS + THIRD_PARTY_APPS
```

#### Migrations

```sh
#
./manage.py makemigrations core

#
./manage.py migrate core
```

##### Rollback

```sh
#
./manage.py showmigrations

#
./manage.py migrate core zero

#
./manage.py migrate core [name - 1]
```

#### Fixtures

```sh
#
mkdir -p ./core/fixtures

#
./manage.py dumpdata core > ./core/fixtures/core.json

./manage.py dumpdata core.[ModelName] > ./core/fixtures/[model_name].json

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

#### Collect Static

```py
# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.1/howto/static-files/

STATIC_URL = '/static/'

STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'assets'),
)

STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

```sh
#
echo '/static' >> ./.gitignore

#
./manage.py collectstatic --no-input --dry-run

#
./manage.py collectstatic --clear --noinput
```

#### Media

```py
MEDIA_URL = '/media/'

MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
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
``` -->

<!-- #### Migration

```sh
./manage.py makemigrations xxxs
./manage.py sqlmigrate xxxs 0001
``` -->

#### Flush (Remove Database)

```sh
./manage.py flush
```

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

## Docker Compose

### Manifest

```yaml
version: '3.7'

services:
  django:
    build: ./
    container_name: django
    hostname: django
    ports:
      - target: 8000
        published: 8000
        protocol: tcp
    networks:
      - workbench
    restart: always
    depends_on:
      - anything

networks:
  workbench:
    name: workbench
    external: true
```

## Dockerfile

### Image

####

```Dockerfile
FROM docker.io/library/python:3.7-alpine AS translations

WORKDIR /usr/src/app

RUN apk add -q --no-cache \
      gettext==0.20.2-r0 \
      gettext-dev==0.20.2-r0

COPY ./requirements.txt ./

RUN pip install -q --no-cache-dir -r ./requirements.txt

COPY ./core ./core
COPY ./App ./App
COPY ./manage.py ./manage.py
COPY ./locale ./locale

RUN ./manage.py compilemessages

# ---

FROM docker.io/library/python:3.7-alpine

WORKDIR /usr/src/app

RUN addgroup -g 1000 django && \
      adduser -S -u 1000 django -G django

COPY --chown=django:django ./requirements.txt ./

RUN pip install --no-cache-dir -r ./requirements.txt

COPY --chown=django:django ./core ./core
COPY --chown=django:django ./App ./App
COPY --chown=django:django ./manage.py ./manage.py
COPY --from=translations --chown=django:django /usr/src/app/locale ./locale

USER django:django

COPY ./docker-entrypoint.sh /sbin/entrypoint.sh

EXPOSE 5000

ENTRYPOINT ["/sbin/entrypoint.sh"]
```

```sh
#! /bin/bash
set -e

# Look for static folder, if it does not exist, then generate it
if [ ! -d '/usr/src/app/static' ]; then
    ./manage.py collectstatic --clear --noinput
fi

# Apply database migrations
if [[ "$APPLY_MIGRATIONS" = "1" ]]; then
    echo "Applying database migrations..."
    /usr/src/app/manage.py migrate --no-input
fi

# Check that there are no pending migrations to generate
if [[ "$CHECK_MIGRATIONS" = "1" ]]; then
  echo "Checking database migrations..."
  /usr/src/app/manage.py makemigrations --dry-run --no-input --check -v 3
fi

# Create superuser
# if [[ "$CREATE_SUPERUSER" = "1" ]]; then
#     ./manage.py add_admin_user -u admin -p admin -e admin@example.com
#     echo "Admin user created with credentials admin:admin (email: admin@example.com)"
# fi

# Start server
if [[ ! -z "$*" ]]; then
    "$@"
elif [[ "$DEV_SERVER" = "1" ]]; then
    /usr/src/app/manage.py runserver 0.0.0.0:8000
else
    uwsgi --ini /usr/src/app/uwsgi.ini
fi

```

<!-- ####

```Dockerfile
FROM docker.io/library/python:3.7-alpine

WORKDIR /usr/src/app

RUN apk add -q --no-cache -t .build-deps \
      gettext==0.20.2-r0 \
      gettext-dev==0.20.2-r0

COPY ./requirements.txt ./

RUN pip install --no-cache-dir -r ./requirements.txt

RUN ./manage.py compilemessages

RUN apk del --purge .build-deps

COPY ./ ./

EXPOSE 5000

CMD ["gunicorn", "-b", "0:5000", "-k", "eventlet", "app:app"]
``` -->

## Library

### Environment

***settings.py***

```py
#
ENV = os.environ.get('DJANGO_ENV', 'local')

#
SECRET_KEY = os.environ.get('SECRET_KEY', 'secretkey')

#
DEBUG = os.getenv('DJANGO_ENV') != 'production'
```

### Tips

#### Favicon

```py
from django.conf.urls import url
from django.views.generic import RedirectView

urlpatterns = (
    # ...
    url(r'^favicon\.ico$', RedirectView.as_view(url='/static/favicon.ico')),
)
```

### Issues

####

```log
You are trying to add the field 'created_at' with 'auto_now_add=True' to application without a default; the database needs something to populate existing rows.
```

```py
>>> timezone.now
```

```log
You are trying to add a non-nullable field 'created_by' to application without a default; we can't do that (the database needs something to populate existing rows).
```

TODO
