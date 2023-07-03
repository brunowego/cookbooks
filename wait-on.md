# wait-on

## Links

- [Code Repository](https://github.com/jeffbski/wait-on)

## CLI

### Installation

```sh
# Using NPM
npm install wait-on -g
```

### Commands

```sh
wait-on -h
```

### Usage

```sh
wait-on -v http://127.0.0.1:3000
```

### Issues

#### Method Not Allowed

```log
making HTTP(S) head request to  url:http://127.0.0.1:3000 ...
  HTTP(S) error for http://127.0.0.1:3000 Error: connect ECONNREFUSED 127.0.0.1:3000
```

```sh
#
curl -I http://127.0.0.1:3000

#
curl --head http://127.0.0.1:3000
```

## Library

### Installation

```sh
# Using pnpm
pnpm add wait-on -D
```

### Configuration

```json
{
  // ...
  "scripts": {
    // ...
    "dev": "wait-on http://127.0.0.1:3000 && <command>"
  }
}
```
