# PostfixAdmin

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mysql \
  -e MYSQL_ROOT_PASSWORD='root' \
  -e MYSQL_USER='postfix' \
  -e MYSQL_PASSWORD='postfix' \
  -e MYSQL_DATABASE='postfix' \
  -v mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name postfix-mysql \
  docker.io/library/mysql:5.7
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h redis \
  -e REDIS_PASSWORD='postfix' \
  -v redis-data:/data \
  -p 6379:6379 \
  --name postfix-redis \
  docker.io/library/redis:5.0.5-alpine3.9 /bin/sh -c 'redis-server --appendonly yes --requirepass ${REDIS_PASSWORD}'
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mailserver \
  -v mailserver-data:/var/mail \
  -e DBHOST='postfix-mysql' \
  -e DBPORT='3306' \
  -e DBUSER='postfix' \
  -e DBPASS='postfix' \
  -e DBNAME='postfix' \
  -e REDIS_HOST='postfix-redis' \
  -e REDIS_PORT='6379' \
  -e REDIS_PASS='postfix' \
  -e RSPAMD_PASSWORD='Pa$$w0rd!' \
  -e DOMAIN='example.com' \
  -p 25:25 \
  -p 143:143 \
  --name mailserver \
  docker.io/hardware/mailserver:1.1-stable
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postfixadmin \
  -e DBHOST='postfix-mysql' \
  -e DBPORT='3306' \
  -e DBUSER='postfix' \
  -e DBPASS='postfix' \
  -e DBNAME='postfix' \
  -p 8888:8888 \
  --name postfixadmin \
  docker.io/hardware/postfixadmin:3.2
```

### Configuration

1. Go to the setup page:

   ```sh
   echo -e '[INFO]\thttp://127.0.0.1:8888/setup.php'
   ```

   - Change setup password
     - Setup password: `s3cr3t`
     - Setup password (again): `s3cr3t`
     - Generate password hash -> Copy `setup_password` hash
   - Set the setup hash:

     ```sh
     echo '[hash]' | docker exec -i postfixadmin setup
     ```

   - Create superadmin account
     - Setup password: `s3cr3t`
     - Admin: `admin@example.com`
     - Password: `s3cr3t`
     - Password (again): `s3cr3t`
     - Add Admin

2. Go to the login page:

   ```sh
   echo -e '[INFO]\thttp://127.0.0.1:8888/login.php'
   ```

3. Domain List -> New Domain -> Add a new domain
   - Domain: `example.com`
   - Add Domain
4. Virtual List -> Add Mailbox -> Create a new mailbox for your domain.
   - Username: `contact`
   - Password: `s3cr3t`
   - Password (again): `s3cr3t`
   - Name: Contact
   - Add Mailbox
5. Send Email
   - To: `contact@example.com`
   - Send Message

### Remove

```sh
docker rm -f postfix-mysql postfix-redis mailserver postfixadmin
docker volume rm mysql-data redis-data mailserver-data
```
