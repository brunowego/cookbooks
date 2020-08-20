# JUnit

## Java ARchive

### Installation

#### Darwin

```sh
#
sudo mkdir -p /Library/JUnit

# JUnit
sudo wget \
  -O /Library/JUnit/junit-4.13.jar \
  https://search.maven.org/remotecontent?filepath=junit/junit/4.13/junit-4.13.jar

# Hamcrest
sudo wget \
  -O /Library/JUnit/hamcrest-core-1.3.jar \
  https://search.maven.org/remotecontent?filepath=org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# JUnit
export JUNIT_HOME='/Library/JUnit'
export JUNIT_JARS="${JUNIT_HOME}/junit-4.13.jar:${JUNIT_HOME}/hamcrest-core-1.3.jar"

export CLASSPATH="${CLASSPATH}${CLASSPATH:+:}${JUNIT_JARS}:."
```

### Running

```sh
javac TestPerson.java
java org.junit.runner.JUnitCore TestPerson
```
