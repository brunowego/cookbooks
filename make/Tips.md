# Tips

## Variable

```Makefile
[VARIABLE] := [value]
```

- [Dealing with assignment operator](https://github.com/amjadmajid/Makefile#dealing-with-assignment-operator)

##

```Makefile
[VARIABLE] ?= $(shell [command])
```

### SHELL

```Makefile
SHELL := /bin/sh
```

## Include

```Makefile
include [/path/to/file]
```

```Makefile
-include [/path/to/file]
```

## Phony Targets

```Makefile
.PHONY: [name]
```
