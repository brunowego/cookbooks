# Flask SQLAlchemy

## Library

### Dependencies

- [SQLAlchemy](/sqlalchemy.md#library)

### Installation

```sh
# As user dependency
pip3 install -U Flask-SQLAlchemy

# As project dependency
echo 'Flask-SQLAlchemy==2.5.1' >> ./requirements.txt
```

### Databases

#### PostgreSQL

```py
>>> DB_HOST = environ.get('DB_HOST', '127.0.0.1')
>>> DB_PORT = environ.get('DB_PORT', '5432')
>>> DB_USER = environ.get('DB_USER', 'user')
>>> DB_PASS = environ.get('DB_PASS', 'pass')
>>> DB_NAME = environ.get('DB_NAME', 'dev')
>>> SQLALCHEMY_DATABASE_URI = f"postgresql+psycopg2://{DB_USER}:{DB_PASS}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
>>> SQLALCHEMY_TRACK_MODIFICATIONS = environ.get('SQLALCHEMY_TRACK_MODIFICATIONS') or False
```

#### MySQL

```py
>>> DB_HOST = environ.get('DB_HOST', '127.0.0.1')
>>> DB_PORT = environ.get('DB_PORT', '3306')
>>> DB_USER = environ.get('DB_USER', 'user')
>>> DB_PASS = environ.get('DB_PASS', 'pass')
>>> DB_NAME = environ.get('DB_NAME', 'dev')
>>> CHARSET = environ.get('CHARSET', 'utf8')
>>> SQLALCHEMY_DATABASE_URI = f"mysql+pymysql://{DB_USER}:{DB_PASS}@{DB_HOST}:{DB_PORT}/{DB_NAME}?charset={CHARSET}"
>>> SQLALCHEMY_TRACK_MODIFICATIONS = environ.get('SQLALCHEMY_TRACK_MODIFICATIONS') or False
```

#### Oracle

```py
>>> DB_HOST = environ.get('DB_HOST', '127.0.0.1')
>>> DB_PORT = environ.get('DB_PORT', '1521')
>>> DB_USER = environ.get('DB_USER', 'user')
>>> DB_PASS = environ.get('DB_PASS', 'pass')
>>> DB_NAME = environ.get('DB_NAME', 'dev')
>>> CHARSET = environ.get('CHARSET', 'utf8')
>>> SQLALCHEMY_DATABASE_URI = f"oracle+cx_oracle://{DB_USER}:{DB_PASS}@{DB_HOST}:{DB_PORT}/{DB_NAME}?charset={CHARSET}"
>>> SQLALCHEMY_TRACK_MODIFICATIONS = environ.get('SQLALCHEMY_TRACK_MODIFICATIONS') or False
```
