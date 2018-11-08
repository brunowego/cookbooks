# Tips

## Memory

- `Xmx` specifies the maximum memory
- `Xms` specifies the initial memory allocation pool

```sh
java -Xms256m -Xmx2g
```

### Set JAVA_OPTS

```sh
export JAVA_OPTS="$JAVA_OPTS -Xms256m -Xmx2g"
```

## Read MANIFEST.MF file from JAR

```sh
unzip -p [name].jar META-INF/MANIFEST.MF
```

## Get JAVA_HOME

```sh
java -XshowSettings:properties -version 2>&1 > /dev/null | grep 'java.home'
```

### Homebrew

```sh
/usr/libexec/java_home -V
```

```sh
/usr/libexec/java_home -v 11.0.1
```

## NPAPI

Enabling NPAPI in Chrome Version 42 and later

1. In your URL bar, enter: chrome://flags/#enable-npapi
2. Click the Enable link for the Enable NPAPI configuration option.
3. Click the Relaunch button that now appears at the bottom of the configuration page.
