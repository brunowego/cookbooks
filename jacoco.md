# Java Code Coverage (JaCoCo)

<!--
https://medium.com/capital-one-tech/improve-java-code-with-unit-tests-and-jacoco-b342643736ed
https://tomgregory.com/how-to-measure-code-coverage-using-sonarqube-and-jacoco/
-->

## Alternatives

- JCov
- [OpenClover](http://openclover.org/)
- [Cobertura](https://cobertura.github.io/cobertura/)

## Links

- [Code Repository](https://github.com/jacoco/jacoco)

## Guides

- [Intro to JaCoCo](https://baeldung.com/jacoco)

## Library

### Apache Maven

#### Project Object Model (POM)

```xml
<properties>
  <!-- ... -->
  <jacoco.version>0.8.7</jacoco.version>
</properties>

<dependencies>
  <!-- ... -->
  <dependency>
    <groupId>org.jacoco</groupId>
    <artifactId>org.jacoco.agent</artifactId>
    <classifier>runtime</classifier>
    <scope>test</scope>
    <version>${jacoco.version}</version>
  </dependency>
</dependencies>

<plugins>
  <!-- ... -->
  <plugin>
    <artifactId>maven-surefire-plugin</artifactId>
    <version>${surefire-plugin.version}</version>
    <configuration>
      <excludedGroups>integration</excludedGroups>
      <systemPropertyVariables>
        <jacoco-agent.destfile>${project.build.directory}/jacoco-ut.exec</jacoco-agent.destfile>
        <java.util.logging.manager>org.jboss.logmanager.LogManager</java.util.logging.manager>
        <maven.home>${maven.home}</maven.home>
      </systemPropertyVariables>
    </configuration>
    <executions>
      <execution>
        <id>integration-tests</id>
        <phase>integration-test</phase>
        <goals>
          <goal>test</goal>
        </goals>
        <configuration>
          <excludedGroups>!integration</excludedGroups>
          <groups>integration</groups>
          <systemPropertyVariables>
            <jacoco-agent.destfile>${project.build.directory}/jacoco-it.exec</jacoco-agent.destfile>
          </systemPropertyVariables>
        </configuration>
      </execution>
    </executions>
  </plugin>
  <plugin>
    <groupId>org.jacoco</groupId>
    <artifactId>jacoco-maven-plugin</artifactId>
    <version>${jacoco.version}</version>
    <executions>
      <execution>
        <id>instrument-ut</id>
        <goals>
          <goal>instrument</goal>
        </goals>
      </execution>
      <execution>
        <id>restore-ut</id>
        <goals>
          <goal>restore-instrumented-classes</goal>
        </goals>
      </execution>
      <execution>
        <id>report-ut</id>
        <goals>
          <goal>report</goal>
        </goals>
        <configuration>
          <dataFile>${project.build.directory}/jacoco-ut.exec</dataFile>
          <outputDirectory>${project.reporting.outputDirectory}/jacoco-ut</outputDirectory>
        </configuration>
      </execution>
      <execution>
        <id>instrument-it</id>
        <phase>pre-integration-test</phase>
        <goals>
          <goal>instrument</goal>
        </goals>
      </execution>
      <execution>
        <id>restore-it</id>
        <phase>post-integration-test</phase>
        <goals>
          <goal>restore-instrumented-classes</goal>
        </goals>
      </execution>
      <execution>
        <id>report-it</id>
        <phase>post-integration-test</phase>
        <goals>
          <goal>report</goal>
        </goals>
        <configuration>
          <dataFile>${project.build.directory}/jacoco-it.exec</dataFile>
          <outputDirectory>${project.reporting.outputDirectory}/jacoco-it</outputDirectory>
        </configuration>
      </execution>
      <execution>
        <id>merge-results</id>
        <phase>verify</phase>
        <goals>
          <goal>merge</goal>
        </goals>
        <configuration>
          <fileSets>
            <fileSet>
              <directory>${project.build.directory}</directory>
              <includes>
                <include>*.exec</include>
              </includes>
            </fileSet>
          </fileSets>
          <destFile>${project.build.directory}/jacoco.exec</destFile>
        </configuration>
      </execution>
      <execution>
        <id>post-merge-report</id>
        <phase>verify</phase>
        <goals>
          <goal>report</goal>
        </goals>
        <configuration>
          <dataFile>${project.build.directory}/jacoco.exec</dataFile>
          <outputDirectory>${project.reporting.outputDirectory}/jacoco</outputDirectory>
        </configuration>
      </execution>
    </executions>
  </plugin>
</plugins>
```

```sh
#
mvn clean verify

# Unit tests
./target/site/jacoco-ut

# Integration tests
open ./target/site/jacoco-it/index.html

#
./target/site/jacoco
```
