# WordPress Queries

```sh
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D wordpress_dev \
  -u root \
  -p'root' \
  -ve 'SELECT * FROM `wp_options` WHERE option_name = "db_version"'

mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D wordpress_dev \
  -u root \
  -p'root' \
  -ve 'SELECT `option_value` FROM `wp_options` WHERE `wp_options`.`option_name` = "siteurl"'

mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D wordpress_dev \
  -u root \
  -p'root' \
  -ve 'UPDATE `wp_options` SET `option_value` = "http://127.0.0.1:8080" WHERE `wp_options`.`option_name` = "siteurl"'

mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D wordpress_dev \
  -u root \
  -p'root' \
  -ve 'UPDATE `wp_options` SET `option_value` = "http://127.0.0.1:8080" WHERE `wp_options`.`option_name` = "home"'

mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D wordpress_dev \
  -u root \
  -p'root' \
  -ve 'UPDATE `wp_options` SET `option_value` = "twentysixteen" WHERE `wp_options`.`option_name` = "template"'
```
