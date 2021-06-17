# JUnit

<!--
https://www.youtube.com/watch?v=Geq60OVyBPg

https://app.pluralsight.com/paths/skills/unit-testing-in-java
https://app.pluralsight.com/library/courses/test-automation-java-fundamentals/
https://app.pluralsight.com/library/courses/junit-5-fundamentals/table-of-contents

https://app.pluralsight.com/paths/skill/unit-testing-in-java
https://app.pluralsight.com/library/courses/migrating-junit4-junit5-testing-platform/table-of-contents

https://linkedin.com/learning/spring-test-driven-development-with-junit/welcome
-->

## Alternatives

- [TestNG](/testng.md)

## History

- JUnit 3 for Java 5+
- JUnit 4 for Java 8+
- JUnit 5 for Java 8+

## References

- [Dependency Information](https://junit.org/junit4/dependency-info.html)
- xUnit Framework
- SUnit for Smalltalk

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

## Maven Plugin

### Usage

```sh
# All tests
mvn test

# Single test
mvn -Dtest=TestApp1 test

# Multiple tests
mvn -Dtest=TestApp1,TestApp2 test

# Method test
mvn -Dtest=TestApp1#methodname test

# All methods match pattern tests
mvn -Dtest=TestApp1#testHello* test

# All methods match pattern 'testHello*' and 'testMagic*' tests
mvn -Dtest=TestApp1#testHello*+testMagic* test
```
