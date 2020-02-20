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

- [dynaconf](https://github.com/rochacbruno/dynaconf)
- [Flasgger](https://github.com/flasgger/flasgger)
- [python-dotenv](https://github.com/theskumar/python-dotenv)

- [Bcrypt](https://flask-bcrypt.readthedocs.io/en/latest/)
- [Connexion](https://connexion.readthedocs.io/en/latest/)
- [CORS](https://flask-cors.readthedocs.io/en/latest/)
- [Migrate](https://flask-migrate.readthedocs.io/en/latest/)
- [PyMongo](https://flask-pymongo.readthedocs.io/en/latest/)
- [RESTful](https://flask-restful.readthedocs.io/en/latest/)
- [SQLAlchemy](https://flask-sqlalchemy.palletsprojects.com/en/2.x/)
- [WTF](https://flask-wtf.readthedocs.io/en/stable/)

### Installation

#### PIP

```sh
pip install Flask
```

### Commands

```sh
flask --help
```

### Using

#### Routes

```sh
FLASK_ENV=development flask routes
```

#### Run

```sh
FLASK_ENV=development flask run
```

#### Shell

```sh
FLASK_ENV=development flask shell
```

## Docker

### Build

```sh
cat << EOF | docker build $(echo $DOCKER_BUILD_OPTS) -t example/flask-app -
FROM docker.io/python:3.7-alpine3.9

RUN pip install -q --no-cache Flask===1.0.3

WORKDIR /usr/src/app

ENTRYPOINT ["flask"]

EOF
```

### Running

```sh
docker run -i --rm \
  -v flask-app:/usr/src/app \
  alpine:3.9 /bin/sh << EOSHELL
cat << EOF > /usr/src/app/app.py
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello World!'

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
