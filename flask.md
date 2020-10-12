# Flask

<!--
https://github.com/albertfougy/microservices-app
https://github.com/opatua/cookiecutter-flask-api
https://github.com/tannguyenit/flask-infrastructure-api

https://www.packtpub.com/web-development/flask-framework-cookbook-second-edition
https://www.packtpub.com/web-development/hands-on-docker-for-microservices-with-python
https://github.com/tolgahanuzun/Flask-Login-Example
-->

## CLI

### Extend

- [Bcrypt](https://flask-bcrypt.readthedocs.io/en/latest/)
- [Caching](https://flask-caching.readthedocs.io/en/latest/)
- [Connexion](https://connexion.readthedocs.io/en/latest/)
- [CORS](https://flask-cors.readthedocs.io/en/latest/)
- [dynaconf](https://github.com/rochacbruno/dynaconf)
- [Flasgger](https://github.com/flasgger/flasgger)
- [Migrate](https://flask-migrate.readthedocs.io/en/latest/)
- [PyMongo](https://flask-pymongo.readthedocs.io/en/latest/)
- [python-dotenv](https://github.com/theskumar/python-dotenv)
- [RESTful](https://flask-restful.readthedocs.io/en/latest/)
- [SQLAlchemy](https://flask-sqlalchemy.palletsprojects.com/en/2.x/)
- [WTF](https://flask-wtf.readthedocs.io/en/stable/)

### Installation

#### PIP

```sh
# As user dependency
pip install -U Flask

# As project dependency
echo 'Flask==1.1.2' >> ./requirements.txt
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
FLASK_ENV=development flask run

# Shell
FLASK_ENV=development flask shell
```

### Libraries

```sh
#
echo 'requests==2.24.0' >> ./requirements.txt
```

## Boilerplate

###

```sh
mkdir -p ./api

cat << EOF > ./api/main.py
# -*- coding: utf-8 -*-
"""This module defines a simple REST API."""
from flask import Flask


api = Flask(__name__)


@api.route('/')
def healthCheck():
    """Check health status."""
    return jsonify(status = 'ok')

EOF

cat << EOF > ./wsgi.py
"""Make the server use application."""
from api.main import api


if __name__ == '__main__':
    api.run(debug=True)

EOF
```

###

```py
#
[r for r, in result]

#
[t for t in tasks if t.get('id')==task_id]

#
[{'username': u.username, 'password': u.password, 'id': u.id} for u in users]
```

## Docker

### Build

```sh
cat << EOF | docker build $(echo $DOCKER_BUILD_OPTS) -t example/flask-app -
FROM docker.io/python:3.7-alpine3.9

RUN pip install -q --no-cache Flask===1.1.2

WORKDIR /usr/src/app

ENTRYPOINT ["flask"]

EOF
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
    app.run(debug=True)

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
