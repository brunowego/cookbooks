# python-gitlab

## CLI

### Installation

#### pip3

```sh
pip3 install -U python-gitlab
```

### Configuration

```sh
cat << EOF >> ~/.python-gitlab.cfg
[global]
default = gitlab.com
ssl_verify = true
timeout = 5

[gitlab.com]
url = https://gitlab.com
private_token = [token]
api_version = 4

EOF
```

### Commands

```sh
gitlab -h
```

### Usage

```sh
# Current User
gitlab current-user get

# Project List
gitlab project list

# Project Create
gitlab project create --name [name]

# Issue list
gitlab issue list
```

## Library

### Installation

```sh
# As user dependency
pip3 install -U requests python-gitlab

# As project dependency
cat << EOF >> ./requirements.txt
requests==2.25.1
python-gitlab==2.7.1
EOF
```

### REPL

```sh
export GITHUB_URL=
export GITHUB_TOKEN=
```

```py
>>> import requests
>>> from gitlab import Gitlab
>>> import os
>>>
>>> session = requests.Session()
>>> gl = Gitlab(os.environ['GITHUB_URL'], os.environ['GITHUB_TOKEN'], session=session, ssl_verify=False)
>>> gl.auth()
>>>
>>> project_id = gl.projects.list()[0].id
>>> gl.projects.get(project_id).issues.list()
>>>
>>> exit()
```

## Docker

### Running

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080/profile/personal_access_tokens'
```

```sh
docker run -it --rm \
  -h python-gitlab \
  -e GITLAB_URL='http://127.0.0.1:8080' \
  -e GITLAB_PRIVATE_TOKEN='[token]' \
  --name python-gitlab \
  docker.io/pythongitlab/python-gitlab:latest -h
```
