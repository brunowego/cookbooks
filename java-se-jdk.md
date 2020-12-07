# Java Standard Edition (SE) - Java Development Kit (JDK)

## References

- [Oracle Java Archive](https://www.oracle.com/java/technologies/oracle-java-archive-downloads.html)

## CLI

### Installation

#### Homebrew

```sh
brew cask install oracle-jdk # 14.0.2
```

#### DMG

##### Version 8 and earlier

1. [Java SE 8 Archive Downloads (JDK 8u202 and earlier) ](https://www.oracle.com/java/technologies/javase/javase8-archive-downloads.html)
2. Go to Java SE Development Kit 8u181
   - Click `jdk-8u181-macosx-x64.dmg`
   - Accept the terms
   - Click in Download button

```sh
# Darwin
/usr/libexec/java_home -V

# Darwin
jabba link system@1.8.0-181 /Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk
```

##### Version 7

1. [Java SE 7 Archive Downloads](https://www.oracle.com/java/technologies/javase/javase7-archive-downloads.html)
2. Got to Java SE Development Kit 7u80
   - Click `jdk-7u80-macosx-x64.dmg`
   - Accept the terms
   - Click in Download button

```sh
# Darwin
/usr/libexec/java_home -V

# Darwin
jabba link system@1.7.0-80 /Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk
```

<!-- #### Jabba

```sh
#
jabba install 1.8.0-custom=tgz+file:///tmp/jdk-8u212-linux-x64.tar.gz
``` -->
