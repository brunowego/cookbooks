# Pipenv

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
```

### Usage

```sh
#
pipenv run python ./api.py

#
pipenv run pytest
```

### Tips

#### Completion

```sh
eval "$(pipenv --completion)"
```
