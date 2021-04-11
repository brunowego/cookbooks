# Java

## Installation

```sh
asdf plugin-add java https://github.com/skotchpine/asdf-java.git
```

## Version

```sh
asdf list-all java
```

```sh
asdf install java [version]
```

## Setting

```sh
asdf global java [version]
```

```sh
asdf list java
asdf reshim java [version]
```

## Set JAVA_HOME

```sh
echo '\n# JAVA\nexport JAVA_HOME=$(asdf where java $(asdf current java | sed -s "s|\(.*\) \?(.*|\1|g"))' >> ~/.zshrc
```

```sh
source ~/.zshrc
```
