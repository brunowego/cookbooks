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
pip install -U pipenv
```

### Commands

```sh
pipenv -h
```

#### Run

```sh
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
```

```sh
pipenv install
```

```sh
pipenv run python api.py
```

### Tips

#### Completion

```sh
eval "$(pipenv --completion)"
```
