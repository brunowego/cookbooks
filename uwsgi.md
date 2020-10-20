# uWSGI

## CLI

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

## Boilerplate

###

```sh
cat << EOF > ./wsgi.ini
[uwsgi]
module = wsgi:app

master = true
processes = 5

http = 0.0.0.0:5000

die-on-term = true
EOF

cat << EOF > ./uwsgi.ini
[uwsgi]
chdir = /code
module = evalai.wsgi:application
master = true
processes = 50
http = 0.0.0.0:8000
vaccum = true
python-autoreload = 1
buffer-size=32768
chmod-socket = 777
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
