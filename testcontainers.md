# Testcontainers

<!--
https://github.com/search?o=desc&q=filename%3A.java+%22QuarkusTestResourceLifecycleManager%22&s=indexed&type=Code

https://callistaenterprise.se/blogg/teknik/2020/10/08/getting-started-with-testcontainers/

https://www.youtube.com/results?search_query=testcontainers

~/.testcontainers.properties
-->

## References

- [Testcontainers](https://www.testcontainers.org/)

## Modules

### Databases

#### PostgreSQL

```xml
<properties>
  <!-- ... -->
  <org.testcontainers.postgresql.version>1.15.3</org.testcontainers.postgresql.version>
</properties>

<dependencies>
  <!-- ... -->
  <dependency>
    <groupId>org.testcontainers</groupId>
    <artifactId>postgresql</artifactId>
    <version>${org.testcontainers.postgresql.version}</version>
    <scope>test</scope>
  </dependency>
</dependencies>
```
