# Celery

## References

- [Application](https://docs.celeryproject.org/en/stable/userguide/application.html)

## CLI

### Installation

#### PIP

```sh
pip install -U celery[sqs]
```

<!-- ### Usage

```sh
celery -A evalai worker --loglevel=INFO
``` -->

## Library

### Dependencies

- [MySQL](/mysql.md#Docker)
- [Python 3](/python3.md#Docker)

### Installation

```sh
# As user dependency
pip install -U celery[sqs]

# As project dependency
echo 'celery[sqs]==5.0.1' >> ./requirements.txt
```
