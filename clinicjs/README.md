# Clinic.js

## Links

- [Org. Repository](https://github.com/clinicjs)
- [Main Website](https://clinicjs.org)
- [Docs](https://clinicjs.org/documentation/)

## Library

### Related

- [autocannon](/autocannon.md)

### Installation

```sh
# Using pnpm
pnpm add clinic autocannon -D
```

### Configuration

```json
{
  // ...
  "scripts": {
    // ...
    "dev:doctor": "clinic doctor --on-port 'autocannon -c 100 -d 30 http://localhost:3000' -- node ./dist/src/main.js"
  }
}
```

## CLI

### Links

- [Code Repository](https://github.com/clinicjs/node-clinic)

### Installation

```sh
# Using NPM
npm install clinic -g
```

### Commands

```sh
clinic -h

clinic doctor -h
clinic bubbleprof -h
clinic clean -h
clinic flame -h
clinic heapprofiler -h
```

### Usage

#### With Doctor

```sh
#
clinic doctor -- node ./server.js

#
clinic doctor --on-port 'autocannon -c 100 -d 30 http://localhost:3000' -- node ./server.js
```

#### With Bubbleprof

```sh
#
clinic bubbleprof -- node ./server.js

#
clinic bubbleprof --on-port 'autocannon -c 100 -d 30 http://localhost:3000' -- node ./server.js
```

#### With Flame

```sh
#
clinic flame -- node ./server.js

#
clinic flame --on-port 'autocannon -c 100 -d 30 http://localhost:3000' -- node ./server.js
```

#### With HeapProfiler

```sh
#
clinic heapprofiler -- node ./server.js

#
clinic heapprofiler --on-port 'autocannon -c 100 -d 30 http://localhost:3000' -- node ./server.js
```
