# Clojure

<!--
https://pragprog.com/titles/dswdcloj3/web-development-with-clojure-third-edition/

https://github.com/carlosvalarezo/democars
https://github.com/braidchat/braid
https://github.com/pkamenarsky/atea
https://github.com/nubank/basic-microservice-example
https://github.com/lagenorhynque/microservices-with-clojure

https://www.packtpub.com/application-development/microservices-clojure
https://pragprog.com/book/vmclojeco/clojure-applied
https://www.amazon.com/Joy-Clojure-Michael-Fogus/dp/1617291412

https://github.com/practicalli
http://www.practical.li/

https://dzone.com/articles/why-clojure-4-tech-reasons
https://blog.developer.atlassian.com/why-clojure/
https://github.com/PacktPublishing/Microservices-with-Clojure
https://purelyfunctional.tv/guide/how-to-install-clojure/
https://www.casadocodigo.com.br/products/livro-programacao-funcional-clojure?_pos=1&_sid=cb435693f&_ss=r
https://medium.com/@daniel.oliver.king/a-clojure-development-environment-that-gets-out-of-your-way-c11e6711ead3

https://clojure.org/community/companies
https://clojure.org/stories/pisano
-->

## Docker

### Running

```sh
# REPL
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h clojure \
  --name clojure \
  docker.io/library/clojure:openjdk-8-slim-buster
```

## CLI

### Installation

#### Homebrew

```sh
brew install clojure
```

<!-- ### Usage

```sh
# Version
clojure -e '(clojure-version)'
clojure -e '(println (clojure-version))'
``` -->

### Tips

<!-- #### Visual Studio Code

```sh
code --install-extension betterthantomorrow.calva
``` -->

### Issues

<!-- ####

```log
Error building classpath. Failed to read artifact descriptor for org.clojure:clojure:jar:1.10.1
```

```sh
# APT
# sudo dpkg --purge --force-depends ca-certificates-java
sudo apt -y install ca-certificates-java
``` -->

## Packages

- [HTTP Kit](https://github.com/http-kit/http-kit)
