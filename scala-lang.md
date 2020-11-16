# Scala

<!--
https://www.linkedin.com/learning/scala-essential-training-for-data-science/welcome

https://www.linkedin.com/learning/scala-first-look/welcome
https://www.linkedin.com/learning/scala-essential-training/welcome-to-scala-essential-training
https://www.linkedin.com/learning/learning-jvm-languages-jvm-java-scala/course-overview

https://github.com/niqdev/kafka-scala-examples

https://github.com/gospeak-io/gospeak

https://www.amazon.com.br/Programming-Scala-Comprehensive-Step-Step-ebook/dp/B01EX49FOU/ref=sr_1_2?keywords=Programming-Scala-Comprehensive-Step-Step-ebook&qid=1578012529&sr=8-2
https://www.casadocodigo.com.br/products/livro-scala?_pos=1&_sid=d48c3bd32&_ss=r
-->

## CLI

### Installation

#### Homebrew

```sh
brew install scala
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Scala
export SCALA_HOME='/usr/local/opt/scala/idea'
```

```sh
sudo su - "$USER"
```

### Commands

```sh
scala -help
```

### Usage

```sh
# Version
scala -version 2>&1 | tail -1

# REPL
scala
```

### Project

#### Manual

```sh
mkdir myproject && cd "$_"

mkdir -p project src/{main,test}/scala target

cat << EOF > ./build.sbt
name := "MyProject"

version := "0.1"

scalaVersion := "2.13.1"

EOF
```

#### IntelliJ IDEA

1. Create New Project
2. Scala -> sbt
3. Finish

### Tips

#### Visual Studio Code

```sh
code --install-extension scalameta.metals
```

#### IntelliJ IDEA

1. Configure
2. Plugins
3. Type: [Scala](https://plugins.jetbrains.com/plugin/1347-scala/)
4. Install -> Wait: Restart IDE
5. Restart
