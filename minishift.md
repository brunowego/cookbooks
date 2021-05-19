# Minishift

<!--
minishift oc-env
oc new-build --binary --name=quarkus-hello-app -l app=quarkus-hello-app
mvn clean -DskipTests package -Pnative -Dquarkus.native.container-build=true
oc start-build quarkus-hello-app --from-dir=. --follow
oc new-app quarkus-hello-app -l app=quarkus-hello-app
oc expose service quarkus-hello-app
oc scale --replicas=10 dc/quarkus-hello-app
--- Only updates ---
mvn clean -DskipTests package -Pnative -Dquarkus.native.container-build=true
oc start-build quarkus-hello-app --from-dir=. --follow
-->

## CLI

### Installation

#### Homebrew

```sh
brew install --cask minishift
```

### Chocolatey

```sh
choco install minishift
```
