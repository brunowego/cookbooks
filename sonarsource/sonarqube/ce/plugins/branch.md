# SonarQube CE Branch Plugin

## Links

- [Code Repository](https://github.com/mc1arke/sonarqube-community-branch-plugin)

## Docs

- [Branch Analysis](https://docs.sonarqube.org/latest/branches/overview/)

## Installation

```sh
# Darwin
export SONARQUBE_HOME="$(brew --cellar sonarqube)/$(brew info --json sonarqube | jq -r '.[0].installed[0].version')/libexec"
export SONARQUBE_PLUGINS="${SONARQUBE_HOME}/extensions/plugins"

# Linux
# TODO

# Download Newer
wget -P "$SONARQUBE_PLUGINS" 'https://github.com/mc1arke/sonarqube-community-branch-plugin/releases/download/1.12.0/sonarqube-community-branch-plugin-1.12.0.jar'

#
export SONARQUBE_WEB_JVM_OPTS="-javaagent:"${SONARQUBE_PLUGINS}"/sonarqube-community-branch-plugin-1.12.0.jar=web" \
export SONAR_CE_JAVAOPTS="-javaagent:"${SONARQUBE_PLUGINS}"/sonarqube-community-branch-plugin-1.12.0.jar=ce"
```

## Docker

### Dockerfile

```Dockerfile
FROM docker.io/library/sonarqube:9.6.1-community

ENV SONARQUBE_PLUGINS "${SONARQUBE_HOME}/extensions/plugins"

ADD --chown=sonarqube:sonarqube 'https://github.com/insideapp-oss/sonar-flutter/releases/download/0.4.0/sonar-flutter-plugin-0.4.0.jar' "$SONARQUBE_PLUGINS"
ADD --chown=sonarqube:sonarqube 'https://github.com/Inform-Software/sonar-groovy/releases/download/1.8/sonar-groovy-plugin-1.8.jar' "$SONARQUBE_PLUGINS"
ADD --chown=sonarqube:sonarqube 'https://github.com/sonar-next/sonar-swift/releases/download/1.7.0/sonar-swift-plugin-1.7.0.jar' "$SONARQUBE_PLUGINS"
ADD --chown=sonarqube:sonarqube 'https://github.com/mc1arke/sonarqube-community-branch-plugin/releases/download/1.12.0/sonarqube-community-branch-plugin-1.12.0.jar' "$SONARQUBE_PLUGINS"
ADD --chown=sonarqube:sonarqube 'https://github.com/mc1arke/sonarqube-community-branch-plugin/releases/download/1.12.0/sonarqube-community-branch-plugin-1.12.0.jar' "${SONARQUBE_HOME}/lib/common/"

ENV \
  SONAR_WEB_JAVAADDITIONALOPTS="-javaagent:"${SONARQUBE_PLUGINS}"/sonarqube-community-branch-plugin-1.12.0.jar=web" \
  SONAR_CE_JAVAADDITIONALOPTS="-javaagent:"${SONARQUBE_PLUGINS}"/sonarqube-community-branch-plugin-1.12.0.jar=ce"
```

## Issues

### Run Code Analysis in Azure DevOps

```log
ERROR: Error during SonarScanner execution
ERROR: Validation of project failed:
  o To use the property "sonar.branch.name" and analyze branches, Developer Edition or above is required. See https://redirect.sonarsource.com/doc/branches.html for more information.
ERROR:
ERROR: Re-run SonarScanner using the -X switch to enable full debug logging.
The process '/home/vsts/work/_tasks/SonarQubeAnalyze_6d01813a-9589-4b15-8491-8164aeb38055/5.8.0/sonar-scanner/bin/sonar-scanner' failed with exit code 2
```

Try install [SonarQube CE Branch Plugin](#installation).

### Incompatibility Version

```log
2022.11.23 13:59:12 INFO  app[][o.s.a.ProcessLauncherImpl] Launch process[WEB_SERVER] from [/opt/sonarqube]: /usr/lib/jvm/java-11-openjdk/bin/java -Djava.awt.headless=true -Dfile.encoding=UTF-8 -Djava.io.tmpdir=/opt/sonarqube/temp -XX:-OmitStackTraceInFastThrow --add-opens=java.base/java.util=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.io=ALL-UNNAMED --add-opens=java.rmi/sun.rmi.transport=ALL-UNNAMED --add-exports=java.base/jdk.internal.ref=ALL-UNNAMED --add-opens=java.base/java.nio=ALL-UNNAMED --add-opens=java.base/sun.nio.ch=ALL-UNNAMED --add-opens=java.management/sun.management=ALL-UNNAMED --add-opens=jdk.management/com.sun.management.internal=ALL-UNNAMED -Dcom.redhat.fips=false -javaagent:/opt/sonarqube/data/jmx_prometheus_javaagent.jar=8000:/opt/sonarqube/conf/prometheus-config.yaml -javaagent:/opt/sonarqube/extensions/plugins/sonarqube-community-branch-plugin-1.12.0.jar=web -Dhttp.nonProxyHosts=localhost|127.*|[::1] -cp ./lib/sonar-application-9.7.1.62043.jar:/opt/sonarqube/lib/jdbc/postgresql/postgresql-42.4.1.jar org.sonar.server.app.WebServer /opt/sonarqube/temp/sq-process7991075232780362149properties
13:59:13.649 [main] INFO com.github.mc1arke.sonarqube.plugin.CommunityBranchAgent - Loading agent
Exception in thread "main" java.lang.reflect.InvocationTargetException
	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.base/java.lang.reflect.Method.invoke(Method.java:566)
	at java.instrument/sun.instrument.InstrumentationImpl.loadClassAndStartAgent(InstrumentationImpl.java:513)
	at java.instrument/sun.instrument.InstrumentationImpl.loadClassAndCallPremain(InstrumentationImpl.java:525)
Caused by: java.lang.ClassNotFoundException: org.sonar.server.almsettings.MultipleAlmFeatureProvider
	at java.base/jdk.internal.loader.BuiltinClassLoader.loadClass(BuiltinClassLoader.java:581)
	at java.base/jdk.internal.loader.ClassLoaders$AppClassLoader.loadClass(ClassLoaders.java:178)
	at java.base/java.lang.ClassLoader.loadClass(ClassLoader.java:522)
	at java.base/java.lang.Class.forName0(Native Method)
	at java.base/java.lang.Class.forName(Class.java:315)
	at com.github.mc1arke.sonarqube.plugin.CommunityBranchAgent.redefineEdition(CommunityBranchAgent.java:93)
	at com.github.mc1arke.sonarqube.plugin.CommunityBranchAgent.premain(CommunityBranchAgent.java:56)
	... 6 more
*** java.lang.instrument ASSERTION FAILED ***: "result" with message agent load/premain call failed at src/java.instrument/share/native/libinstrument/JPLISAgent.c line: 422
FATAL ERROR in native method: processing of -javaagent failed, processJavaStart failed
2022.11.23 13:59:17 WARN  app[][o.s.a.p.AbstractManagedProcess] Process exited with exit value [Web Server]: 134
2022.11.23 13:59:17 INFO  app[][o.s.a.SchedulerImpl] Process[Web Server] is stopped
2022.11.23 13:59:17 INFO  app[][o.s.a.SchedulerImpl] Process[ElasticSearch] is stopped
2022.11.23 13:59:17 WARN  app[][o.s.a.p.AbstractManagedProcess] Process exited with exit value [ElasticSearch]: 143
2022.11.23 13:59:17 INFO  app[][o.s.a.SchedulerImpl] SonarQube is stopped
```

Check plugin compatibility version first. [Opened issue](https://github.com/mc1arke/sonarqube-community-branch-plugin/issues/674) about it.
