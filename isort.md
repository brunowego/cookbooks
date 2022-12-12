# isort

## Links

- [Code Repository](https://github.com/PyCQA/isort)
- [Main Webapp](https://pycqa.github.io/isort/)

## CLI

### Installation

#### pip

```sh
pip install isort black
```

### Commands

```sh
isort -h
```

### Configuration

```sh
cat << EOF > ./.isort.cfg

EOF
```

### Usage

```sh
#
isort ./
```

### Tips

#### pre-commit

```yml
---
repos:
  - repo: https://github.com/pycqa/isort
    rev: 5.9.3
    hooks:
      - id: isort
        args: [--profile, black]
```
