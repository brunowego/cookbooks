# Latin1

## Edit locales

```sql
sudo vim /var/lib/locales/supported.d/local

en_US.ISO-8859-1 ISO-8859-1

sudo dpkg-reconfigure locales

createdb -E LATIN1 --template template0 --locale en_US.ISO-8859-1 trial

sudo -u postgres createuser -s $USER
```

Show encoding and set UTF8.

```sql
show client_encoding;
SET client_encoding = 'UTF8';
```

Access PostgreSQL

```sql
su postgres

/usr/lib/postgresql/9.1/bin/initdb --pgdata=/var/lib/postgresql/9.1/main/ --encoding=LATIN1 --locale=C --username=postgres -W

sudo -u postgres psql template1

CREATE DATABASE nome_do_banco ENCODING 'ISO-8859-1' LC_CTYPE 'pt_BR.ISO-8859-1' TEMPLATE template0;

\q
```
