# Quarkus (Quark.Us)

<!--
https://www.youtube.com/watch?v=SQDR34KoC-8
https://www.youtube.com/watch?v=tWHdkpVagXA
https://www.youtube.com/watch?v=Us4gjBRJo1I
https://www.youtube.com/watch?v=9wJm8g83vqA

https://code.quarkus.io/
https://www.apress.com/br/book/9781484260319
https://leanpub.com/playing-with-java-microservices-with-quarkus-and-k8s
https://www.udemy.com/course/des-web-quarkus/
https://www.udemy.com/course/quarkus-backend-development-java/
https://www.redhat.com/pt-br/about/videos/quarkus-basics-master-course
https://www.youtube.com/watch?v=OAxKGelBHRs
https://quarkus.io/quarkus-workshops/super-heroes/
https://www.oreilly.com/attend/getting-started-with-quarkus/0636920436416/0636920470021/
https://howtolearn.blog/quarkus/
https://www.katacoda.com/openshift/courses/middleware/middleware-quarkus
https://www.udemy.com/course/quarkus-starting-with-quarkus/?referralCode=326B47EE8A3032346159
https://piotrminkowski.com/2021/04/14/advanced-graphql-with-quarkus/
https://blogs.oracle.com/developers/configuring-the-oracle-jdbc-drivers-with-quarkus
https://medium.com/@yazidaqel/quarkus-configuration-using-consul-d077dc6d5d3
https://www.amazon.com/Hands-Cloud-Native-Applications-Quarkus-Kubernetes-native-ebook/dp/B082FMCKJG/ref=sr_1_1?dchild=1&keywords=quarkus&qid=1586434790&sr=8-1
-->

## Features

- Full Stack Java Framework: Web Applications, Web Services and Standalone Components.
- Kubernetes Native: Designed for a containerized world.
- Cloud Native:
  - Size, Efficiency and Extensions.
  - Serveless, Containerized, Virtual Machine Operations and 12 Factor Application Scope.
- Container first: Lower memory usage, faster startup times
- Imperative vs. Reactive
  - Combined into simple runtime
  - Single reactive engine used for both types
  - Allows developers to use either with same core
- Quarkus is natively compiled with GraalVM

## Related

- [Java](/java.md)

## Guides

- [Guides](https://quarkus.io/guides/)
- [Creating Your First Application](https://quarkus.io/guides/getting-started)
- [Building applications with Maven](https://quarkus.io/guides/maven-tooling.html)
- [Using the MongoDB Client](https://quarkus.io/guides/mongodb)
- [Datasources](https://quarkus.io/guides/datasource)
- [Using Hibernate ORM and JPA](https://quarkus.io/guides/hibernate-orm)
- [Simplified Hibernate ORM with Panache](https://quarkus.io/guides/hibernate-orm-panache)
- [Using Flyway](https://quarkus.io/guides/flyway)
- [Using Security with JPA](https://quarkus.io/guides/security-jpa)
- [All configuration options](https://quarkus.pro/guides/all-config.html)

## References

- [Extensions Repository](https://github.com/quarkusio/quarkus/tree/main/extensions)
- [QuickStarts for Getting Started Guides](https://github.com/quarkusio/quarkus-quickstarts#quick-start-list)

## Extend

- [Eclipse Vert.x](/eclipse-vert.x.md)
- [Netty](/netty.md)
- [Picocli](https://quarkus.io/guides/picocli)
- [Quarkiverse Hub](https://github.com/quarkiverse)
- Apache Camel
- Eclipse MicroProfile
- Hibernate ORM (Panache)
- JAX-RS
- MicroProfile
- Quarkus Funqy
- RESTEasy

## Frameworks

- Spring Boot
- Dropwizard
- Micronout
- Helidon

## Architecture

- HotSpot JIT
- GraalVM AOT

## Glossary

- Contexts and Dependency Injection (CDI)

## Terms

- Java first
- Container first
- K-Native
- Cloud-Native
- Microservice first
- Function as a Service (Serverless)
- Elastic
- Resilient
- Responsive
- Message-Driven

<!--
## Plugins

resteasy-jsonb
hibernate-validator
rest-client
mongodb-panache
smallrye-openapi
container-image-s2i

assertj-core
-->

<!--
https://www.linkedin.com/learning/learning-quarkus/supersonic-java-with-quarkus

https://www.linkedin.com/learning/java-microservices-with-graalvm/running-java-faster-with-graalvm
https://app.pluralsight.com/library/courses/allthetalks-session-86/table-of-contents

https://www.amazon.com.br/Beginning-Quarkus-Framework-Cloud-Native-Microservices-ebook/dp/B08JGJDQ49/ref=asc_df_B08JGJDQ49/?tag=googleshopp00-20&linkCode=df0&hvadid=469812248540&hvpos=&hvnetw=g&hvrand=4368842893524740968&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=1001541&hvtargid=pla-969767411212&psc=1
https://www.amazon.com.br/Quarkus-Cookbook-Kubernetes-Optimized-Solutions-English-ebook/dp/B08D364VMD/ref=asc_df_B08D364VMD/?tag=googleshopp00-20&linkCode=df0&hvadid=452574157606&hvpos=&hvnetw=g&hvrand=4368842893524740968&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=1001541&hvtargid=pla-929436991334&psc=1

https://www.udemy.com/course/quarkus-backend-development-java/

https://www.udemy.com/course/des-web-quarkus-basico/

https://www.oreilly.com/live-training/courses/java-microservices-with-quarkus-and-microprofile/0636920378327/

https://github.com/quarkusio/quarkus/blob/master/docs/src/main/asciidoc/cli-tooling.adoc

-->

## CLI

### Dependencies

- [Apache Maven](/apache/apache_maven.md)

### Scaffold

```sh
QUARKUS_VERSION=1.13.3.Final \
PROJECT_GROUP_ID=org.acme \
PROJECT_ARTIFACT_ID=app \
PROJECT_VERSION=1.0.0-SNAPSHOT; \
  mvn io.quarkus:quarkus-maven-plugin:"$QUARKUS_VERSION":create \
    -DprojectGroupId="$PROJECT_GROUP_ID" \
    -DprojectArtifactId="$PROJECT_ARTIFACT_ID" \
    -DprojectVersion="$PROJECT_VERSION" \
    -DclassName="${PROJECT_GROUP_ID}.${PROJECT_ARTIFACT_ID}.MyResource"

cd ./"$PROJECT_ARTIFACT_ID"
```

### Commands

```sh
./mvnw quarkus:help
```

### Running

```sh
./mvnw compile quarkus:dev
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
echo -e '[INFO]\thttp://127.0.0.1:8080/q/dev/'
```

### Extensions

```sh
#
./mvnw quarkus:list-extensions

#
./mvnw quarkus:add-extension \
  -Dextensions='resteasy-jsonb, hibernate-validator, rest-client'
```

### Compile

```sh
#
./mvnw compile

#
./mvnw compile quarkus:dev

#
./mvnw compile quarkus:dev -DdebugHost=0.0.0.0
```

### Package

```sh
#
./mvnw package

#
./mvnw package -Dquarkus.package.type=uber-jar

#
./mvnw package -Pnative

#
./mvnw package -Pnative -Dquarkus.native.container-build=true
```

### Profiles

```sh
# Development
./mvnw quarkus:dev -Dquarkus-profile=dev

# Testing
./mvnw quarkus:dev -Dquarkus-profile=test

# Production
./mvnw quarkus:dev -Dquarkus-profile=prod
```

### Properties

```sh
code ./src/main/resources/application.properties
```

```properties
%dev.quarkus.log.level=DEBUG
quarkus.log.category."com.example.app".level=DEBUG

%dev.quarkus.http.port=8080
quarkus.http.port=8080

quarkus.banner.enabled=false
quarkus.http.cors=true
```

## Tips

### IntelliJ IDEA

#### Plugin Install

1. Preferences
2. Plugins
3. Marketplace Tab -> Quarkus Tools

#### Create Module

1. New -> Module...
2. Quarkus Tab -> Next

<!-- ## Issues

###

```log
Caused by: org.postgresql.util.PSQLException: ERROR: column applicatio0_.keyid does not exist
  Hint: Perhaps you meant to reference the column "applicatio0_.keyId".
```

```sh
./mvnw quarkus:add-extension -Dextensions='hibernate-orm'
```

```
# quarkus.hibernate-orm.implicit-naming-strategy = org.hibernate.boot.model.naming.ImplicitNamingStrategyLegacyJpaImpl
# quarkus.hibernate-orm.implicit-naming-strategy = org.hibernate.boot.model.naming.ImplicitNamingStrategyLegacyJpaImpl
# quarkus.hibernate-orm.physical-naming-strategy = org.hibernate.boot.model.naming.PhysicalNamingStrategyStandardImpl
``` -->
