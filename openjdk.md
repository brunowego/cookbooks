# OpenJDK

## References

- [AdoptOpenJDK](https://adoptopenjdk.net/)

## CLI

### Installation

#### Homebrew

```sh
brew tap homebrew/cask-versions
brew cask install adoptopenjdk # AdoptOpenJDK 14
brew cask install adoptopenjdk8 # AdoptOpenJDK 8
```

#### APT

```sh
sudo apt update
sudo apt -y install openjdk-8-jdk
```

#### YUM

```sh
yum check-update
sudo yum -y install java-1.8.0-openjdk-devel
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Show Java Home (Darwin/Linux)
java -XshowSettings:properties -version 2>&1 > /dev/null | grep 'java.home'

# Complete Info (Darwin)
/usr/libexec/java_home -V
```

```sh
# Darwin
echo $(/usr/libexec/java_home -v 1.8)

# Java Home
export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home" # Darwin
export JAVA_HOME='/usr/lib/jvm/java-1.8.0-openjdk-amd64' # Linux
export PATH="$JAVA_HOME/bin:$PATH"
```

```sh
# Linux
# sudo update-alternatives --config javac
sudo update-alternatives --config java
```

```sh
sudo su - "$USER"
```

#### Windows

```sh
setx /M JAVA_HOME "C:\Program Files\Java\jre7"
```

### Tips

#### Memory

- `Xmx` specifies the maximum memory
- `Xms` specifies the initial memory allocation pool

```sh
java -Xms256m -Xmx2g
```

#### Set JAVA_OPTS

```sh
export JAVA_OPTS="$JAVA_OPTS -Xms256m -Xmx2g"
```

#### Read MANIFEST.MF file from JAR

```sh
unzip -p [name].jar META-INF/MANIFEST.MF
```

#### NPAPI

Enabling NPAPI in Chrome Version 42 and later

1. In your URL bar, enter: chrome://flags/#enable-npapi
2. Click the Enable link for the Enable NPAPI configuration option.
3. Click the Relaunch button that now appears at the bottom of the configuration page.

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
# Bash
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h openjdk \
  --name openjdk \
  --network workbench \
  docker.io/library/openjdk:8-jre-slim
```
