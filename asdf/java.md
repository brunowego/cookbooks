# asdf Java

## Installation

```sh
asdf plugin-add java 'https://github.com/skotchpine/asdf-java.git'
```

## Usage

```sh
#
asdf list-all java

#
asdf install java <version>

#
asdf global java <version>

#
asdf list java
asdf reshim java <version>
```

## Set JAVA_HOME

**_Warning:_** Not use if are using [jabba](/jabba.md).

```sh
echo '\n# JAVA\nexport JAVA_HOME=$(asdf where java $(asdf current java | sed -s "s|\(.*\) \?(.*|\1|g"))' >> ~/.zshrc

source ~/.zshrc
```
