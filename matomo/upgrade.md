# Matomo Upgrade

## SQL Diff

### Dependencies

- [Puppeteer](/puppeteer.md#library)

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
export MATOMO_CURRENT_VERSION=3.11.0
export MATOMO_NEXT_VERSION=3.13.3
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mysql \
  -e MYSQL_ROOT_PASSWORD='root' \
  -e MYSQL_USER='matomo' \
  -e MYSQL_PASSWORD='matomo' \
  -e MYSQL_DATABASE='matomo_dev' \
  -v matomo-mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name matomo-mysql \
  --network workbench \
  docker.io/library/mysql:5.7.19
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h matomo \
  -e MATOMO_DATABASE_HOST='matomo-mysql' \
  -e MATOMO_DATABASE_USERNAME='matomo' \
  -e MATOMO_DATABASE_PASSWORD='matomo' \
  -e MATOMO_DATABASE_ADAPTER='MYSQLI' \
  -e MATOMO_DATABASE_DBNAME='matomo_dev' \
  -e MATOMO_DATABASE_TABLES_PREFIX='matomodev_' \
  -v matomo-data:/var/www/html \
  -p 8080:80 \
  --name matomo \
  --network workbench \
  docker.io/library/matomo:$MATOMO_CURRENT_VERSION-apache
```

```sh
node <(cat << \EOF
const puppeteer = require('/usr/local/lib/node_modules/puppeteer');

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.goto('http://127.0.0.1:8080');

  //
  await page.$eval('.next-step > .btn', el => el.click());

  //
  await page.$eval('.next-step > .btn', el => el.click());

  //
  await page.$eval('#submit-0', el => el.click());

  //
  await page.$eval('.next-step > .btn', el => el.click());

  //
  await page.$eval('#login-0', el => el.value = 'admin');
  await page.$eval('#password-0', el => el.value = 'Pa$$w0rd!');
  await page.$eval('#password_bis-0', el => el.value = 'Pa$$w0rd!');
  await page.$eval('#email-0', el => el.value = 'admin@example.com');
  await page.$eval('#submit-0', el => el.click());

  //
  await page.$eval('#siteName-0', el => el.value = 'Example');
  await page.$eval('#url-0', el => el.value = 'http://example.com');
  await page.select('#timezone-0', 'America/Sao_Paulo');
  await page.$eval('#submit-0', el => el.click());

  //
  await page.$eval('.next-step > .btn', el => el.click());

  // Congratulations
  await page.$eval('#submit-0', el => el.click());

  //
  await browser.close();
})();

EOF
)
```

```sh
docker exec -i matomo ./console config:set \
  --section='General' \
  --key='enable_trusted_host_check' \
  --value='0'
```

```sh
mysqldump \
  -h 127.0.0.1 \
  -P 3306 \
  -u matomo \
  -p'matomo' \
  matomo_dev \
  > /tmp/matomo-$MATOMO_CURRENT_VERSION.sql
```

```sh
#
docker exec matomo ./console -V

#
docker exec -i matomo /bin/bash << EOSHELL
curl -L "https://builds.matomo.org/matomo-$MATOMO_NEXT_VERSION.tar.gz" | \
  tar \
    -xzC '/var/www/html' \
    --strip-components 1 \
    --no-same-owner \
    --no-same-permissions
EOSHELL

#
docker exec matomo ./console -V

#
docker exec matomo ./console core:update --yes
```

```sh
mysqldump \
  -h 127.0.0.1 \
  -P 3306 \
  -u matomo \
  -p'matomo' \
  matomo_dev \
  > /tmp/matomo-$MATOMO_NEXT_VERSION.sql
```

```sh
icdiff /tmp/matomo-$MATOMO_CURRENT_VERSION.sql /tmp/matomo-$MATOMO_NEXT_VERSION.sql
```

### Remove

```sh
docker rm -f matomo-mysql matomo

docker volume rm matomo-mysql-data matomo-data

docker network rm workbench
```
