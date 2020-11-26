# Green Unicorn (Gunicorn)

## CLI

### Installation

#### PIP

```sh
# As user dependency
pip install -U gunicorn

# As project dependency
cat << EOF >> ./requirements.txt
gunicorn==20.0.4
eventlet==0.29.1
EOF
```

### Commands

```sh
gunicorn -h
```

<!-- ### Usage

```sh
gunicorn
``` -->

## Dockerfile

### Image

```Dockerfile
EXPOSE 5000

CMD ["gunicorn", "-b", "0:5000", "-k", "eventlet", "app:app"]
```
