# Unix File Descriptors

| Name | File descriptor | Description | Abbreviation |
| --- | --- | --- | --- |
| Standard input | 0 | The default data stream for input, for example in a command pipeline. In the terminal, this defaults to keyboard input from the user. | stdin
| Standard output | 1 | The default data stream for output, for example when a command prints text. In the terminal, this defaults to the user's screen. | stdout
| Standard error | 2 | The default data stream for output that relates to an error occurring. In the terminal, this defaults to the user's screen. | stderr

## Standard In

```sh
touch stdin
```

```sh
example < stdin
```

## Standard Out

```sh
cat << EOF | > output.txt
Example of output.
EOF
```

```sh
cat << EOF | 1> output.txt
Example of output.
EOF
```

## Standard Error

```sh
cat nop.txt 2> error.txt
```

##

```sh
touch stdin
```

```sh
example < stdin > stdout 2> stderr
```
