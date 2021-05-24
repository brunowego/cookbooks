# Project Lombok

## Library

### Apache Maven

#### Project Object Model (POM)

```xml
<properties>
  <!-- ... -->
  <org.projectlombok.lombok.version>1.18.20</org.projectlombok.lombok.version>
</properties>

<dependencies>
  <!-- ... -->
  <dependency>
    <groupId>org.projectlombok</groupId>
    <artifactId>lombok</artifactId>
    <version>${org.projectlombok.lombok.version}</version>
    <scope>provided</scope>
  </dependency>
</dependencies>
```

## Tips

### Visual Studio Code

```sh
code --install-extension gabrielbb.vscode-lombok
```
