# Java Standard Edition (SE)

## References

- [Oracle Java Archive](https://www.oracle.com/java/technologies/oracle-java-archive-downloads.html)

## Java Development Toolkit (JDK)

### Installation

#### Homebrew

```sh
brew install --cask oracle-jdk
```

#### DMG

##### Version 7

1. [Java SE 7 Archive Downloads](https://www.oracle.com/java/technologies/javase/javase7-archive-downloads.html)
2. Got to Java SE Development Kit 7u80
   - Click `jdk-7u80-macosx-x64.dmg`
   - Accept the terms
   - Click in Download button

```sh
# Darwin
hdiutil attach ~/Downloads/jdk-7u80-macosx-x64.dmg -mountpoint /Volumes/JDK\ 7\ Update\ 80

open /Volumes/JDK\ 7\ Update\ 80/JDK\ 7\ Update\ 80.pkg
```

```sh
# Darwin
/usr/libexec/java_home -V

jabba link system@1.7.0-80 /Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk
jabba ls
jabba use system@1.7.0-80
jabba current
jabba alias default system@1.7.0-80
```

##### Version 8

1. [Java SE 8 Archive Downloads (JDK 8u202 and earlier)](https://www.oracle.com/java/technologies/javase/javase8-archive-downloads.html)
2. Go to Java SE Development Kit 8u202
   - Click `jdk-8u202-macosx-x64.dmg`
   - Accept the terms
   - Click in Download button

```sh
# Darwin
hdiutil attach ~/Downloads/jdk-8u202-macosx-x64.dmg -mountpoint /Volumes/JDK\ 8\ Update\ 202

open /Volumes/JDK\ 8\ Update\ 202/JDK\ 8\ Update\ 202.pkg
```

###### Connect with jabba

```sh
# Darwin
/usr/libexec/java_home -V

jabba link system@1.8.0-202 /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk
jabba ls
jabba use system@1.8.0-202
jabba current
jabba alias default system@1.8.0-202
```

##### Version 11

1. [Java SE Development Kit 11 Downloads](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html)
2. Go to Java SE Development Kit 11.0.11
   - Click `jdk-11.0.11_osx-x64_bin.dmg`
   - Accept the terms
   - Click in Download button

```sh
# Darwin
hdiutil attach ~/Downloads/jdk-11.0.11_osx-x64_bin.dmg -mountpoint /Volumes/JDK\ 11.0.11

open /Volumes/JDK\ 11.0.11/JDK\ 11.0.11.pkg
```

###### Connect with jabba

```sh
# Darwin
/usr/libexec/java_home -V

jabba link system@11.0.11 /Library/Java/JavaVirtualMachines/jdk-11.0.11.jdk
jabba ls
jabba use system@11.0.11
jabba current
jabba alias default system@11.0.11
```

##### Version 14

1. [Java SE 14 Archive Downloads](https://www.oracle.com/java/technologies/javase/jdk14-archive-downloads.html)
2. Go to Java SE Development Kit 14.0.2
   - Click `jdk-14.0.2_osx-x64_bin.dmg`
   - Accept the terms
   - Click in Download button


```sh
# Darwin
hdiutil attach ~/Downloads/jdk-14.0.2_osx-x64_bin.dmg -mountpoint /Volumes/JDK\ 14.0.2

open /Volumes/JDK\ 14.0.2/JDK\ 14.0.2.pkg
```

###### Connect with jabba

```sh
# Darwin
/usr/libexec/java_home -V

jabba link system@14.0.2 /Library/Java/JavaVirtualMachines/jdk-14.0.2.jdk
jabba ls
jabba use system@14.0.2
jabba current
jabba alias default system@14.0.2
```
