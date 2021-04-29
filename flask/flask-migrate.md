# Flask Migrate

## References

- [Code Repository](https://github.com/miguelgrinberg/flask-migrate/)
- [Alembic’s Documentation](https://alembic.sqlalchemy.org/en/latest/)

## Library

### Dependencies

- [Flask](/flask.md#library)

### Installation

```sh
# As user dependency
pip3 install -U Flask-Migrate

# As project dependency
echo 'Flask-Migrate==2.7.0' >> ./requirements.txt
```

### Commands

```sh
flask db --help
```

### Usage

```sh
#
flask db init

#
flask db migrate -m 'Initial migration.'

#
flask db upgrade
```
