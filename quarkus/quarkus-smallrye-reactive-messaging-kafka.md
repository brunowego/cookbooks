# Quarkus SmallRye Reactive Messaging Kafka

<!--
https://github.com/fagnersoliver/quarkus-kakfa/blob/main/pom.xml
-->

##

```sh
#
mvn quarkus:add-extension \
  -Dextensions='smallrye-reactive-messaging-kafka'
```

```ini
mp.messaging.incoming.[name].connector = smallrye-kafka
mp.messaging.incoming.[name].value.deserializer =
mp.messaging.incoming.[name].group.id =
```
