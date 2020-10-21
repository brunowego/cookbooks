# EvalAI

## Docker Compose

### Running

```sh
#
git clone https://github.com/Cloud-CV/EvalAI.git evalai && cd "$_"

#
docker-compose up --build
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8888'
```

| Login | Password |
| --- | --- |
| admin | password |
| host | password |
| participant | password |

## Docker Swarm

### Dependencies

- [Docker Swarm](/docker-swarm.md#cluster-provision)

```sh
git clone https://github.com/Cloud-CV/EvalAI.git evalai && cd "$_"
```

### Running

```sh
docker stack deploy -c ./docker-compose.yml evalai
```

```sh
#
echo -e "[INFO]\thttp://$(docker-machine ip manager1):????"
```

### Remove

```sh
docker stack rm evalai
```

## Source Code

### Git Clone

```sh
git clone https://github.com/Cloud-CV/EvalAI.git evalai && cd "$_"
```

### Environment

***pyenv***

```sh
pyenv install 3.6.12

eval "$(pyenv init -)"

pyenv local 3.6.12
```

***Virtualenv***

```sh
pip install -U virtualenv

virtualenv ./.venv

source ./.venv/bin/activate
```

***PostgreSQL***

```sh
#
docker network create workbench \
  --subnet 10.1.1.0/24

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgres \
  -e POSTGRES_PASSWORD='postgres' \
  -e POSTGRES_USER='evalai' \
  -e POSTGRES_PASSWORD='evalai' \
  -e POSTGRES_DB='evalai' \
  -v evalai-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name evalai-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

***Environment Variables***

```sh
export SECRET_KEY='thisISaSECRET_1234'

export POSTGRES_NAME='evalai'
export POSTGRES_USER='evalai'
export POSTGRES_PASSWORD='evalai'
export POSTGRES_HOST='127.0.0.1'
export POSTGRES_PORT='5432'
```

### Dependencies

```sh
pip install -r ./requirements/dev.txt
```

### Running

```sh
#
python ./manage.py migrate --settings=settings.dev

#
python ./manage.py seed --settings=settings.dev

#
python ./manage.py runserver --settings=settings.dev

#
python ./manage.py show_urls --settings=settings.dev
```

### Endpoints

```sh
#
echo -e '[INFO]\thttp://127.0.0.1:8000/docs'

#
curl http://127.0.0.1:8000/api/challenges/challenge/past | jq
```
