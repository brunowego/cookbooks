# Quarkus MapStruct

## References

- [MapStruct + Quarkus](https://github.com/mapstruct/mapstruct-examples/tree/master/mapstruct-quarkus)

##

```xml
<org.mapstruct.version>1.4.2.Final</org.mapstruct.version>

<dependency>
  <groupId>org.mapstruct</groupId>
  <artifactId>mapstruct</artifactId>
  <version>${org.mapstruct.version}</version>
  <scope>provided</scope>
</dependency>
<dependency>
  <groupId>org.mapstruct</groupId>
  <artifactId>mapstruct-processor</artifactId>
  <version>${org.mapstruct.version}</version>
  <scope>provided</scope>
</dependency>
```

```xml
<plugin>
  <groupId>org.apache.maven.plugins</groupId>
  <artifactId>maven-compiler-plugin</artifactId>
  <version>3.5.1</version>
  <configuration>
    <source>1.8</source>
    <target>1.8</target>
    <annotationProcessorPaths>
      <path>
        <groupId>org.mapstruct</groupId>
        <artifactId>mapstruct-processor</artifactId>
        <version>${org.mapstruct.version}</version>
      </path>
    </annotationProcessorPaths>
    <showWarnings>true</showWarnings>
    <compilerArgs>
      <arg>
        -Amapstruct.suppressGeneratorTimestamp=true
      </arg>
      <arg>
        -Amapstruct.suppressGeneratorVersionInfoComment=true
      </arg>
      <arg>
        -Amapstruct.verbose=true
      </arg>
    </compilerArgs>
  </configuration>
</plugin>
```
