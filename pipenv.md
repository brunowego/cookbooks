# Pipenv

## Alternatives

- [Poetry](/poetry.md)
- [Python Package Index (PIP3)](/pip3.md)

## CLI

### Installation

#### Homebrew

```sh
brew install pipenv
```

#### APT

```sh
sudo update
sudo apt -y install pipenv
```

#### PIP

```sh
pip3 install -U pipenv
```

### Commands

```sh
pipenv -h
```

### Manifest

```sh
#
tee ./Pipfile << EOF
[[source]]
name = 'pypi'
url = 'https://pypi.org/simple'
verify_ssl = true

[dev-packages]

[packages]

[requires]
python_version = '3.7'
EOF

#
pipenv install

#
pipenv shell
```

### Usage

```sh
#
pipenv run python ./api.py

#
pipenv run pytest

#
pipenv graph
```

### Tips

#### Visual Studio Code

**Dependencies:** [Tom's Obvious, Minimal Language (TOML)](/toml.md)

```sh
jq '."files.associations"."Pipenv" |= "toml"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

#### Completion

```sh
eval "$(pipenv --completion)"
```

## Dockerfile

```sh
#
cat << EOF
FROM docker.io/library/python:3.9.6-slim-buster

ENV PYTHONUNBUFFERED 1

WORKDIR /usr/src/app

COPY ./Pipfile ./Pipfile.lock ./

RUN pip install --no-cache-dir \
      pipenv===2021.5.29 && \
        pipenv install --system
EOF

#
cat << EOF > ./dockerignore
/*

!/Pipfile*
EOF
```

<!--
RUN apt-get update && \
    apt-get --no-install-recommends -y install \
      gcc=4:8.3.0-1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
-->

<!--
gcc
linux-libc-dev
libc6-dev
-->

<!--
DEBIAN_FRONTEND=noninteractive
-->
