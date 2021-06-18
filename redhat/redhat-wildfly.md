# Red Hat WildFly (JBoss Application Server)

## Links

- [Documentation](https://docs.wildfly.org/)

## References

- [JBoss Application Server (AS)](/jboss.md)

## Glossary

- Enterprise Application Server (EAP)

## CLI

### Installation

#### Homebrew

```sh
brew install wildfly-as
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
  -h wildfly \
  -p 8080:8080 \
  -p 9990:9990 \
  --name wildfly \
  --network workbench \
  docker.io/jboss/wildfly:23.0.2.Final /opt/jboss/wildfly/bin/standalone.sh \
    -b 0.0.0.0 \
    -bmanagement 0.0.0.0
```

```sh
# Add management admin user with password admin
docker exec -i wildfly /opt/jboss/wildfly/bin/add-user.sh 'admin' 'admin'

# Add application user with password user
docker exec -i wildfly /opt/jboss/wildfly/bin/add-user.sh -a 'user' 'user'
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'

# HAL Management Console
echo -e '[INFO]\thttp://127.0.0.1:9990'
```

### Remove

```sh
docker rm -f wildfly
```
