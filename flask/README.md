# Flask

<!--
https://github.com/Innopoints/backend

https://app.pluralsight.com/paths/skill/building-web-applications-with-flask

https://linkedin.com/learning/flask-essential-training/web-development-with-flask

https://github.com/arthurchiquet/Dashboard
https://github.com/KoeusIss/holbietheque
https://flask.palletsprojects.com/en/1.1.x/testing/
https://dev.to/paurakhsharma/flask-rest-api-part-6-testing-rest-apis-4lla

https://github.com/albertfougy/microservices-app
https://github.com/opatua/cookiecutter-flask-api
https://github.com/tannguyenit/flask-infrastructure-api

https://www.packtpub.com/web-development/flask-framework-cookbook-second-edition
https://www.packtpub.com/web-development/hands-on-docker-for-microservices-with-python
https://github.com/tolgahanuzun/Flask-Login-Example

https://github.com/GermanChair/RYSN
-->

## Alternatives

- [FastAPI](/fastapi.md)

## CLI

### Extend

- [Bcrypt](https://flask-bcrypt.readthedocs.io/en/latest/)
- [Caching](https://flask-caching.readthedocs.io/en/latest/)
- [Connexion](https://connexion.readthedocs.io/en/latest/)
- [CORS](https://flask-cors.readthedocs.io/en/latest/)
- [dynaconf](https://github.com/rochacbruno/dynaconf)
- [Flasgger](https://github.com/flasgger/flasgger)
- [Login](https://flask-login.readthedocs.io/en/latest/)
- [marshmallow](https://marshmallow.readthedocs.io/en/stable/)
- [Migrate](https://flask-migrate.readthedocs.io/en/latest/)
- [PyMongo](https://flask-pymongo.readthedocs.io/en/latest/)
- [python-dotenv](https://github.com/theskumar/python-dotenv)
- [RESTful](https://flask-restful.readthedocs.io/en/latest/)
- [SQLAlchemy](https://flask-sqlalchemy.palletsprojects.com/en/2.x/)
- [Werkzeug](https://werkzeug.palletsprojects.com/en/1.0.x/utils/)
- [WTF](https://flask-wtf.readthedocs.io/en/stable/)

### Installation

#### pip

```sh
pip3 install -U Flask
```

### Commands

```sh
flask --help
```

### Using

```sh
# Routes
FLASK_ENV=development flask routes

# Run
FLASK_ENV=development flask run \
  --host=0.0.0.0 \
  --port=8080

# Shell
FLASK_ENV=development flask shell
```

### Tips

#### PM2

```sh
# Start
pm2 start \
  --watch \
  --interpreter python3 \
  ./wsgi.py

# List
pm2 list

# Stop
pm2 stop wsgi
```

<!-- ### Libraries

```sh
#
echo 'requests==2.24.0' >> ./requirements.txt
``` -->

## Library

### Tools

- [Sentry](https://sentry.io/for/flask/)

### Installation

```sh
# As user dependency
pip3 install -U Flask

# As project dependency
cat << EOF >> ./requirements-dev.txt
pydocstyle==4.0.1
pylint==2.4.3
EOF

echo 'Flask==1.1.2' >> ./requirements.txt
```

```sh
pip3 install \
  -r ./requirements-dev.txt \
  -r ./requirements.txt
```

### Bootstrap App

```sh
#
mkdir -p ./app

#
cat << EOF > ./app/main.py
# -*- coding: utf-8 -*-
"""This module defines a simple REST API."""
from flask import Flask, jsonify


app = Flask(__name__)


@app.route('/')
def health_check():
    """Check health status."""
    return jsonify(status='ok')
EOF

#
cat << EOF > ./wsgi.py
"""Make the server use application."""
from app.main import app
from os import environ


host = environ.get('FLASK_HOST', '0.0.0.0')
port = environ.get('FLASK_PORT', 8080)
debug = environ.get('FLASK_DEBUG', False)


if __name__ == '__main__':
    app.run(host=host, port=port, debug=debug)
EOF

#
FLASK_ENV=development flask run \
  --host=0.0.0.0 \
  --port=8080
```

### Tips

####

```py
#
[r for r, in result]

#
[t for t in tasks if t.get('id')==task_id]

#
[{'username': u.username, 'password': u.password, 'id': u.id} for u in users]

#
'%s=%s' % (v[0], v[1]) for v in values

#
{p[0]: p[1] for p in params}

#
','.join([str(h.get('name')) for h in hostnames])
```

### Issues

<!-- ####

```log
flask.cli.NoAppException: Could not locate a Flask application. You did not provide the "FLASK_APP" environment variable, and a "wsgi.py" or "app.py" module was not found in the current directory.
```

TODO -->


## Docker

### Build

```sh
cat << EOF | docker build $(echo $DOCKER_BUILD_OPTS) -t example/flask-app -
FROM docker.io/python:3.7-alpine3.9

RUN pip3 install -q --no-cache Flask===1.1.2

WORKDIR /usr/src/app

ENTRYPOINT ["flask"]
EOF

# CMD ["python", "-m", "flask", "run", "--host=0.0.0.0", "--port=5000"]
```

### Running

```sh
docker run -i --rm \
  -v flask-app:/usr/src/app \
  docker.io/library/alpine:3.9 /bin/sh << EOSHELL
cat << EOF > /usr/src/app/app.py
from flask import Flask


app = Flask(__name__)


@app.route('/')
def hello():
    return 'Hello World!'


if __name__ == '__main__':
    app.run(host='0.0.0.0', port='8080', debug=True)
EOF
EOSHELL
```

```sh
docker run -d \
  -h flask-app \
  -e FLASK_APP=app.py \
  -e FLASK_ENV=development \
  -v flask-app:/usr/src/app \
  -p 5000:5000 \
  --name flask-app \
  example/flask-app:latest run -h 0.0.0.0
```

```sh
curl -i "http://127.0.0.1:5000"
```

### Remove

```sh
docker rm -f flask-app

docker volume rm flask-app
```
