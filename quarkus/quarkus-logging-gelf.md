# Quarkus Logging GELF

<!--
https://www.youtube.com/watch?v=EIDLxWYqN9s
-->

## References

- Graylog Extended Log Format (GELF)

##

```sh
#
mvn quarkus:add-extension \
  -Dextensions='logging-gelf'
```

```ini
quarkus.log.handler.gelf.enabled = true
```
