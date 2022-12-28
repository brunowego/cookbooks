# Ruby on Rails

<!--
https://hub.docker.com/r/owasp/railsgoat

https://github.com/myhearty-org/myhearty-api

https://linkedin.com/learning/paths/become-a-ruby-on-rails-developer
https://linkedin.com/learning/topics/ruby-on-rails?entityType=COURSE

https://app.pluralsight.com/paths/skill/building-web-apps-with-ruby-on-rails

https://github.com/chaskiq/chaskiq

https://app.pluralsight.com/library/courses/creating-api-rails/table-of-contents

https://matthewhoelter.com/2020/11/10/deploying-ruby-on-rails-for-ubuntu-2004.html
https://matthewhoelter.com/2020/06/10/setup-spina-cms-with-ruby-on-rails-6-and-digital-ocean.html
https://matthewhoelter.com/2020/02/19/how-to-setup-force-ssl-on-nginx-and-lets-encrypt.html
https://matthewhoelter.com/2019/09/12/setting-up-and-testing-rails-6.0-with-rspec-factorybot-and-devise.html

https://linkedin.com/learning/ruby-on-rails-6-essential-training/faster-better-less-painful-website-development
https://linkedin.com/learning/ruby-on-rails-6-essential-training-models-and-associations/let-activerecord-objects-manage-your-data
-->

## Plugins

- [Rails ERD](https://voormedia.github.io/rails-erd/install.html#generate)

## CLI

### Dependencies

- [Bundler](/rubygems/bundler.md)
- [PostgreSQL](/postgresql/server.md#homebrew) or [MySQL](/mysql.md#homebrew)

### Installation

#### RubyGems

```sh
gem install rails
```

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Usage

```sh
# Create Project
rails new api \
  -d postgresql \
  -T \
  --api \
  -B

# Access Project Folder
cd api

#
bundle config set path './vendor/bundle'
bundle install

# Generate Secret
# rails secret

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgres \
  -v rails-postgres-data:/var/lib/postgresql/data \
  -e POSTGRES_USER='api' \
  -e POSTGRES_PASSWORD='api' \
  -p 5432:5432 \
  --name api-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine

#
cat << EOF > ./config/database.yml
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: api
  password: api
  host: 127.0.0.1
  port: 5432

development:
  <<: *default
  database: api_development

test:
  <<: *default
  database: api_test

production:
  <<: *default
  database: api

EOF

# Database
rails db:create
rails db:setup
rails db:migrate

# Console
rails console

# Server
## Start
rails server \
  -b 0.0.0.0 \
  -p 3000

#
rails stats

echo -e '[INFO]\thttp://127.0.0.1:3000'

## Stop
kill -9 $(lsof -i tcp:3000 -t)

docker rm -f api-postgres
docker volume rm rails-postgres-data
```

#### Credentials

```sh
rails credentials:help
```

#### Engines

```sh
rails plugin new [engine] \
  -d postgresql \
  -T \
  --mountable \
  --api

mkdir -p engines

mv [engine] engines
```

> Prefix all things inside the engine with the main app name. Ex.: app_engine

#### Plugins

```sh
rails plugin new [engine] \
  -d postgresql \
  -T \
  --api
```

### Tips

#### Rbenv

```sh
vim .rbenv-vars

SECRET_KEY_BASE='S3cr3t_K#Key'
[APPNAME]_DATABASE_PASSWORD=

rbenv vars
```

#### PostgreSQL

```sh
sudo vim /etc/postgresql/9.5/main/pg_hba.conf

local	all		[appname]				md5

sudo systemctl restart postgresql
```

#### Clean up comments

```sh
^#.*\s
```

### ActionCable

```sh
sudo vim /etc/nginx/sites-available/[appname]

server {
	...

	location /cable {
		passenger_app_group_name [appname]_action_cable;
		passenger_force_max_concurrent_requests_per_process 0;
	}
}
```

```sh
sudo systemctl restart nginx
```

### Uninstall

```sh
gem uninstall rails
```
