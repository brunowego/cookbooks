# Django

<!--
https://github.com/vintasoftware/
https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-django-application-on-ubuntu-14-04
-->

## CLI

### References

- [Writing your first Django app, part 1](https://docs.djangoproject.com/en/3.0/intro/tutorial01/)
- [Settings](https://docs.djangoproject.com/en/3.0/ref/settings/)

### Dependencies

- [Virtualenv](/virtualenv.md)
- [PostgreSQL](/postgresql.md)

### Installation

#### PIP

```sh
pip install -U django
```

### Commands

```sh
python -m django
```

### Usage

```sh
# Version
python -m django version

# Start Project
django-admin startproject app && cd "$_"

# Virtualenv
virtualenv ./.venv

source ./.venv/bin/activate

#
cat << EOF > ./requirements-dev.txt
pydocstyle==4.0.1
pylint==2.4.3
EOF

cat << EOF > ./requirements.txt
Django==3.0.2
EOF

pip install \
  -r ./requirements-dev.txt \
  -r ./requirements.txt

# Help
python ./manage.py

# Check for issues
python ./manage.py check
```

```sh
# https://docs.djangoproject.com/en/3.0/ref/settings/#databases

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgres \
  -e POSTGRES_USER='app' \
  -e POSTGRES_PASSWORD='app' \
  -e POSTGRES_DB='app_dev' \
  -v app-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name app-postgres \
  docker.io/library/postgres:11.2-alpine

#
echo 'psycopg2==2.8.4' >> ./requirements.txt

# export LDFLAGS='-I/usr/local/opt/openssl/include -L/usr/local/opt/openssl/lib'

LDFLAGS="-L$(brew --prefix openssl)/lib" \
  CFLAGS="-I$(brew --prefix openssl)/include" \
  pip install -r ./requirements.txt

#
code ./app/settings.py
```

```py
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'app_dev',
        'USER': 'app',
        'PASSWORD': 'app',
        'HOST': '127.0.0.1',
        'PORT': '5432',
    }
}
```

```sh
# Migrations
python ./manage.py showmigrations
python ./manage.py migrate

# Create Super User
python ./manage.py createsuperuser \
  --username admin \
  --email admin@example.com

# Create Application
python ./manage.py startapp polls

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
nohup python ./manage.py runserver 0.0.0.0:8000 &

# Tail Server
tail -f ./nohup.out

#
echo -e '[INFO]\thttp://127.0.0.1:8000'
echo -e '[INFO]\thttp://127.0.0.1:8000/admin'

# Stop Server
lsof -i tcp:8000 -t | xargs kill -9

# Flush (Remove Database)
python ./manage.py flush
```

#### Migration

```sh
python ./manage.py makemigrations xxxs
python ./manage.py sqlmigrate xxxs 0001
```

#### Shell

```sh
python ./manage.py shell

# https://github.com/django-extensions/django-extensions
python ./manage.py shell_plus

# DB Shell
python ./manage.py dbshell
```

#### Data

```sh
python ./manage.py dumpdata [name] > [name].json
python ./manage.py loaddata [name].json
```

#### Tests

```sh
python ./manage.py test --failfast
```
