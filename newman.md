# Newman

## Links

- [Code Repository](https://github.com/postmanlabs/newman)

## CLI

### Installation

#### Homebrew

```sh
brew install newman
```

#### NPM

```sh
npm install -g newman
```

### Commands

```sh
newman -h
```

### Structure

```sh
#
mkdir -p ./.postman

#
touch ./.postman/[my-app].postman_collection.json
touch ./.postman/env.dev.json
```

### Usage

```sh
#
newman run \
  -e ./.postman/env.dev.json \
  -r html,cli,json,junit \
  ./.postman/[my-app].postman_collection.json
```
