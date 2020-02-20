# SSLPoke

## References

- [Git Repository](https://github.com/MichalHecko/SSLPoke)

## CLI

### Dependencies

- [OpenJDK](/openjdk.md)

### Installation

#### JAR

```sh
curl -L "https://github.com/MichalHecko/SSLPoke/releases/download/$(curl -s https://api.github.com/repos/MichalHecko/SSLPoke/releases/latest | grep tag_name | cut -d '"' -f 4)/SSLPoke.jar" -o "${JAVA_HOME}/lib/sslpoke.jar"
```

### Usage

```sh
java -jar "${JAVA_HOME}/lib/sslpoke.jar" subdomain.example.com 443
```
