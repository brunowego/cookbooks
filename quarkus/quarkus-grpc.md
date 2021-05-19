# Quarkus gRPC Remote Procedure Calls (gRPC)

<!--
https://www.udemy.com/course/des-web-quarkus/learn/lecture/20442555#overview
https://github.com/alizard0/protobuffer-notes/blob/8f0fcb8b2abbed9c108a773532e264344ef6bedb/README.md
-->

##

```sh
#
mvn quarkus:add-extension \
  -Dextensions='grpc'
```

<!-- ```xml
<build>
  <plugins>
    <plugin>
      <groupId>io.quarkus</groupId>
      <artifactId>quarkus-maven-plugin</artifactId>
      <version>${quarkus-plugin.version}</version>
      <extensions>true</extensions>
      <executions>
        <execution>
          <goals>
            <goal>build</goal>
            <goal>generate-code</goal>
            <goal>generate-code-tests</goal>
          </goals>
        </execution>
      </executions>
    </plugin>
  </plugins>
</build>
``` -->
