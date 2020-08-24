# Oracle JDK

## References

- [Oracle Java Archive](https://www.oracle.com/java/technologies/oracle-java-archive-downloads.html)

## CLI

### Installation

#### Homebrew

```sh
brew cask install oracle-jdk
```

#### DMG

##### JDK 8u202 and earlier

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

#
export JAVA_VERSION="`/usr/libexec/PlistBuddy -c 'Print :JavaVM:JVMVersion' $(dirname $(/usr/libexec/java_home -v 1.8))/Info.plist`"
# FIXME: 1.8.0_265 is not a valid version / 1.8.0-265 is a valid version
jabba link system@"$JAVA_VERSION" $(dirname $(dirname $(/usr/libexec/java_home -v 1.8)))
```

<!-- #### Jabba

```sh
#
jabba install 1.8.0-custom=tgz+file:///tmp/jdk-8u212-linux-x64.tar.gz
``` -->
