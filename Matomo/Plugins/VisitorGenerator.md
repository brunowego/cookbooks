# VisitorGenerator

## Installation

```sh
git clone --branch 3.1.1 --single-branch --depth 1 https://github.com/matomo-org/plugin-VisitorGenerator.git plugins/VisitorGenerator
```

## Active

```sh
./console plugin:activate VisitorGenerator
```

## Generate

### Anonymize log

```sh
./console visitorgenerator:anonymize-log [file]
```

### Annotation

```sh
./console visitorgenerator:generate-annotation --idsite 1
```

### Goals

```sh
./console visitorgenerator:generate-goals --idsite 1
```

### Users

```sh
./console visitorgenerator:generate-users --limit 100
```

### Visits

```sh
./console visitorgenerator:generate-visits \
  --idsite 1 \
  --custom-piwik-url http://127.0.0.1:8000
```

#### Live

```sh
./console visitorgenerator:generate-live-visits \
  --idsite 1 \
  --log-file ./plugins/VisitorGenerator/tests/data/test.log \
  --custom-matomo-url http://127.0.0.1:8000
```

#### Websites

```sh
./console visitorgenerator:generate-websites --limit 10
```

#### Shorten log

```sh
./console visitorgenerator:shorten-log [file]
```
