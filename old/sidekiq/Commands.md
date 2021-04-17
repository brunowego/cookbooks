# Commands

## Start

```sh
bundle exec sidekiq
```

## Reset

```sh
rails c
Sidekiq::Stats.new.reset
```

## Show Process

```sh
ps -ef | grep sidekiq | grep -v grep
```

## Kill Process

```sh
ps -ef | grep sidekiq | grep -v grep | awk '{print $2}' | xargs kill -9
```
