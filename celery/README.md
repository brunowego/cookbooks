# Celery

## References

- [Code Repository](https://github.com/celery/celery)
- [Main Website](https://docs.celeryproject.org/en/stable/index.html)
- [Docs / User Guide](https://docs.celeryproject.org/en/stable/userguide/index.html)

## CLI

### Installation

#### pip

List of [Transports and Backends](https://github.com/celery/celery#transports-and-backends).

```sh
#
pip3 install -U celery
```

### Commands

```sh
celery --help
celery worker --help
```

### Usage

```sh
#
celery \
  -A [app] \
  worker \
    -l INFO
```

## Library

### Dependencies

- [MySQL](/mysql.md#Docker)
- [Python 3](/python3.md#Docker)

### Installation

```sh
# As user dependency
pip3 install -U celery[amqp]

# As project dependency
echo 'celery[amqp]==5.0.1' >> ./requirements.txt
```
