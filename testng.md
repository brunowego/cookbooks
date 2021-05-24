# TestNG

<!--
https://app.pluralsight.com/library/courses/testng-getting-started/table-of-contents
-->

## Links

- [Main Website](https://testng.org/doc/)

## Library

### Project Object Model (POM)

```xml
<properties>
  <!-- ... -->
  <org.testng.version>7.4.0</org.testng.version>
</properties>

<dependencies>
  <!-- ... -->
  <dependency>
    <groupId>org.testng</groupId>
    <artifactId>testng</artifactId>
    <version>${org.testng.version}</version>
    <scope>test</scope>
  </dependency>
</dependencies>
```
