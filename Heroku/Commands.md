# Commands

## Restart

```sh
heroku restart --app APP
```

## Database

### Reset

```sh
heroku pg:reset DATABASE --app APP
heroku run rake db:migrate --app APP
heroku run console --app APP
```

```sh
heroku run rake db:seed --app APP
```

###

```sh
heroku pg:psql --app APP < database.sql
```

## Log

```sh
heroku logs --tail --app APP
```
