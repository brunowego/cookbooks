# Mockito

<!--
https://www.linkedin.com/learning/practical-test-driven-development-for-java-programmers/welcome
-->

## Links

- [Code Repository](https://github.com/mockito/mockito)
- [Maven Central](https://search.maven.org/search?q=org.mockito)

## Library

### Dependencies

- [JUnit Jupiter](/junit/junit-jupiter.md) or [TestNG](/testng.md)

### Apache Maven

#### Project Object Model (POM)

```xml
<properties>
  <!-- ... -->
  <org.mockito.version>3.10.0</org.mockito.version>
</properties>

<dependencies>
  <!-- ... -->
  <dependency>
    <groupId>org.mockito</groupId>
    <artifactId>mockito-core</artifactId>
    <version>${org.mockito.version}</version>
    <scope>test</scope>
  </dependency>
</dependencies>
```
