# Quarkus SmallRye Reactive Messaging AMQP

## References

- Advanced Message Queuing Protocol (AMQP)

##

```sh
#
mvn quarkus:add-extension \
  -Dextensions='smallrye-reactive-messaging-amqp'
```

```ini
# mp.messaging.[outgoing|incoming].[channel-name].[property] = [value]

ampq-username = admin
ampq-password = Pa$$w0rd
```
