# Green Unicorn (Gunicorn)

## CLI

### Installation

#### pip

```sh
# As user dependency
pip3 install -U gunicorn

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

### Issues

#### Missing `/dev/shm`

```log
RuntimeError: /dev/shm doesn't exist. Can't create workertmp.
```

TODO

<!--
--worker-tmp-dir=
--worker-tmp-dir /dev/shm
-->

## Dockerfile

### Image

```Dockerfile
# ...

EXPOSE 5000

CMD ["gunicorn", "-b", "0:5000", "-k", "eventlet", "app:app"]
```
