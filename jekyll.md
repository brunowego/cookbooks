# Jekyll

## Links

- [Code Repository](https://github.com/jekyll/jekyll)
- [Main Website](https://jekyllrb.com)

## CLI

### Dependencies

- [Bundler (RubyGems)](/rubygems/bundler.md)

### Installation

#### Bundler

```sh
bundle add jekyll
```

### Commands

```sh
bundle exec jekyll -h
```

### Configuration

```sh
#
bundle add jekyll-theme-slate

#
cat << EOF >> ./.gitignore
/_site
/.jekyll-cache
EOF
```

### Usage

```sh
#
bundle exec jekyll new ./

#
bundle exec jekyll serve

#
bundle exec jekyll build
```

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h jekyll \
  -v jekyll-data:/srv/jekyll \
  -p 4000:4000 \
  --name jekyll \
  --network workbench \
  docker.io/jekyll/jekyll:4.0 jekyll serve --force_polling --drafts --livereload --trace --incremental
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:4000'
```

### Remove

```sh
docker rm -f jekyll

docker volume rm jekyll-data
```
