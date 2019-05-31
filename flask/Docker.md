# Docker

## Volume

```sh
docker volume create flask-app
```

## Build

```sh
cat << EOF | docker build -t example/flask-app -
FROM python:3.7-alpine3.9

RUN pip install --no-cache-dir Flask==1.0.3

WORKDIR /usr/src/app

ENTRYPOINT ["flask"]

EOF
```

## Running

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
  --restart always \
  example/flask-app:latest run -h 0.0.0.0
```

```sh
curl -i http://"$(docker-machine ip)":5000
```

## Remove

```sh
docker rm -f flask-app
docker volume rm flask-app
```
