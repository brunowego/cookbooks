# Heroku

## CLI

### Installation

#### Homebrew

```sh
brew tap heroku/brew
brew install heroku
```

### Usage

```sh
#
heroku restart --app APP

# Reset
heroku pg:reset DATABASE --app APP
heroku run rake db:migrate --app APP
heroku run console --app APP

#
heroku run rake db:seed --app APP

#
heroku pg:psql --app APP < ./database.sql

# Logs
heroku logs --tail --app APP
```
