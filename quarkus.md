# Quarkus (Quark.Us)

<!--
https://code.quarkus.io/
https://www.apress.com/br/book/9781484260319
https://leanpub.com/playing-with-java-microservices-with-quarkus-and-k8s

https://quarkus.io/guides/hibernate-orm-panache
-->

## References

- [Guides](https://quarkus.io/guides/)

## Extend

- [Eclipse Vert.x](/eclipse-vert.x.md)
- [Netty](/netty.md)
- RESTEasy
- JAX-RS
- Hibernate ORM (Panache)
- Eclipse MicroProfile
- Apache Camel
- [Quarkiverse Hub](https://github.com/quarkiverse)
- Quarkus Funqy
- MicroProfile

## Frameworks

- Spring Boot
- Dropwizard
- Micronout
- Helidon

## Architecture

- HotSpot JIT
- GraalVM AOT

<!--
Java first
Container first
K-Native
Cloud-Native
Microservice first
Function as a Service (Serverless)

Elastic
Resilient
Responsive
Message-Driven
-->

TODO

<!--
https://www.linkedin.com/learning/java-microservices-with-graalvm/running-java-faster-with-graalvm
https://app.pluralsight.com/library/courses/allthetalks-session-86/table-of-contents

https://www.amazon.com.br/Beginning-Quarkus-Framework-Cloud-Native-Microservices-ebook/dp/B08JGJDQ49/ref=asc_df_B08JGJDQ49/?tag=googleshopp00-20&linkCode=df0&hvadid=469812248540&hvpos=&hvnetw=g&hvrand=4368842893524740968&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=1001541&hvtargid=pla-969767411212&psc=1
https://www.amazon.com.br/Quarkus-Cookbook-Kubernetes-Optimized-Solutions-English-ebook/dp/B08D364VMD/ref=asc_df_B08D364VMD/?tag=googleshopp00-20&linkCode=df0&hvadid=452574157606&hvpos=&hvnetw=g&hvrand=4368842893524740968&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=1001541&hvtargid=pla-929436991334&psc=1

https://www.udemy.com/course/quarkus-backend-development-java/

https://www.udemy.com/course/des-web-quarkus-basico/

https://www.oreilly.com/live-training/courses/java-microservices-with-quarkus-and-microprofile/0636920378327/
-->

## CLI

<!--
https://github.com/quarkusio/quarkus/blob/master/docs/src/main/asciidoc/cli-tooling.adoc
-->

```sh
mvn quarkus:add-extension -Dextensions='container-image-docker'

mvn package -Dmaven.tet.skip=true -Dquarkus.container-image.build=true
```
