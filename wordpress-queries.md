# WordPress Queries

```sh
#
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D wordpress_dev \
  -u root \
  -p'root' \
  -ve 'SELECT * FROM `wp_options` WHERE option_name = "db_version"'

#
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D wordpress_dev \
  -u root \
  -p'root' \
  -ve 'SELECT `option_value` FROM `wp_options` WHERE `wp_options`.`option_name` = "siteurl"'

#
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D wordpress_dev \
  -u root \
  -p'root' \
  -ve 'UPDATE `wp_options` SET `option_value` = "http://127.0.0.1:8080" WHERE `wp_options`.`option_name` = "siteurl"'

#
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D wordpress_dev \
  -u root \
  -p'root' \
  -ve 'UPDATE `wp_options` SET `option_value` = "http://127.0.0.1:8080" WHERE `wp_options`.`option_name` = "home"'

#
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D wordpress_dev \
  -u root \
  -p'root' \
  -ve 'UPDATE `wp_options` SET `option_value` = "twentysixteen" WHERE `wp_options`.`option_name` = "template"'

#
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D wordpress_dev \
  -u root \
  -p'root' \
  -ve 'UPDATE `wp_users` SET `user_login` = "brunowego", `user_nicename` = "brunowego" WHERE `wp_users`.`user_login` = "admin"'

#
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D wordpress_dev \
  -u root \
  -p'root' \
  -ve 'UPDATE `wp_usermeta` SET `meta_value` = "brunowego" WHERE `wp_usermeta`.`meta_key` = "nickname" AND `wp_usermeta`.`meta_value` = "admin"'

#
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D wordpress_dev \
  -u root \
  -p'root' \
  -ve 'UPDATE `wp_users` SET `user_email` = "brunowego@gmail.com" WHERE `wp_users`.`user_login` = "brunowego"'

#
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D wordpress_dev \
  -u root \
  -p'root' \
  -ve 'UPDATE `wp_users` SET `user_pass` = MD5("Pa$$w0rd!") WHERE `wp_users`.`user_login` = "admin"'
```
