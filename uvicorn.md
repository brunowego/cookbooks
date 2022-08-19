# Uvicorn

**Keywords:** ASGI

## Links

- [Code Repository](https://github.com/encode/uvicorn)
- [Main Website](https://uvicorn.org/)

## Alternatives

- Hypercorn
- daphne

## Terms

- Asynchronous Server Gateway Interface (ASGI)
- Web Server Gateway Interface (WSGI)

## CLI

### Installation

```sh
# As user dependency
pip3 install -U uvicorn

# As project dependency
echo 'uvicorn==0.18.2' >> ./requirements.txt
```

### Commands

```sh
uvicorn --help
```

### Usage

```sh
#
uvicorn app.main:app --reload

#
uvicorn app.main:app \
  --port 3000 \
  --reload \
  --log-level info
```
