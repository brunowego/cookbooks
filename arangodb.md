# ArangoDB

**Keywords:** NoSQL Database, Graph Database, Key-Value Store

## Links

- [Code Repository](https://github.com/arangodb/arangodb)
- [Main Website](https://arangodb.com)

## <!--

services:
database:
image: docker.io/library/arangodb:latest
ports: - "8529:8529"
volumes: - /tmp/snowplow/data:/var/lib/arangodb3
env_file: - ${DEPLOY_ENVIRONMENT_NAME}.env
command: ["arangod", --server.maximal-threads=32"]
-->
