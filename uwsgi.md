# uWSGI

## References

- [uWSGI Options](https://uwsgi-docs.readthedocs.io/en/latest/Options.html)

## CLI

### Dependencies

- [GCC, the GNU Compiler Collection (gcc)](/gcc.md)

### Installation

#### Homebrew

```sh
brew install uwsgi
```

#### PIP

```sh
# As user dependency
pip install -U uWSGI

# As project dependency
echo 'uWSGI==2.0.19.1' >> ./requirements.txt
```

### Commands

```sh
uwsgi -h
```

### Usage

```sh
#
uwsgi --ini ./uwsgi.ini

#
uwsgi --reload /tmp/project-master.pid

#
uwsgi --stop /tmp/project-master.pid
```

### Issues

#### C Compiler

```log
Exception: you need a C compiler to build uWSGI
```

Install [GCC](/gcc.md).

#### Stdio Headers

```log
fatal error: stdio.h: No such file or directory
```

Install [libc-dev](/gcc.md).

### Limits Headers

```log
fatal error: linux/limits.h: No such file or directory
```

Install `linux-headers`.

```sh
apk add linux-headers
```

### PCRE

```log
!!! no internal routing support, rebuild with pcre support !!!
```

Or:

```log
Error loading shared library libpcre.so.1: No such file or directory (needed by /usr/local/bin/uwsgi)
```

Install [PCRE](/pcre.md) before build.

###

```log
uWSGI running as root, you can use --uid/--gid/--chroot options
*** WARNING: you are running uWSGI as root !!! (use the --uid flag) ***
```

```Dockerfile
WORKDIR /usr/src/app

RUN addgroup -g 1000 django && \
      adduser -S -u 1000 django -G django

COPY --chown=django:django ./requirements.txt ./

USER django:django
```

## Boilerplate

### Django

```sh
#
cat << EOF > ./uwsgi.ini
[uwsgi]
chdir = %d
http = :8000
module = App.wsgi:application
chmod-socket = 664
master = True
processes = 4
vacuum = True
thunder-lock = True
enable-threads = True
EOF
```

### Flask

```sh
cat << EOF > ./uwsgi.ini
[uwsgi]
wsgi-file = wsgi.py
callable = app
socket = :8080
processes = 4
threads = 2
master = true
chmod-socket = 660
vacuum = true
die-on-term = true
EOF
```

```sh
cat << EOF > ./wsgi.py
from myapp import create_app

app = create_app()

if __name__ == "__main__":
    app.run()
EOF
```

## Dockerfile

### Image

```Dockerfile
EXPOSE 8000

CMD ["uwsgi", "--ini", "./uwsgi.ini"]
```
