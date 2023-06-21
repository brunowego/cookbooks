# Mermerd

**Keywords:** ERD Diagram

## Links

- [Code Repository](https://github.com/KarnerTh/mermerd)

## Supported Databases

- MySQL
- PostgreSQL
- SQL Server

## CLI

### Installation

```sh
GOBIN=/usr/local/bin go install github.com/KarnerTh/mermerd@latest
```

### Commands

```sh
mermerd -h
```

### Configuration

```sh
#
cat << EOF > ~/.mermerd
---
showAllConstraints: true
encloseWithMermaidBackticks: true
# outputFileName: "my-db.mmd"
debug: false
omitConstraintLabels: false
omitAttributeKeys: false
showDescriptions: "enumValues"
showSchemaPrefix: true
schemaPrefixSeparator: "_"

# connectionStringSuggestions:
#   - postgresql://user:password@localhost:5432/yourDb

# connectionString: postgresql://user:password@localhost:5432/yourDb
# useAllTables: true
EOF
```

### Usage

```sh
#
export POSTGRES_HOST='127.0.0.1'
export POSTGRES_PORT='5432'
export POSTGRES_NAME=''
export POSTGRES_USER='postgres'
export POSTGRES_PASSWORD='postgres'

mermerd -c "postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_NAME}" -s public
```
