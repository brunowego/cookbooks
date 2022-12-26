# Artificial Intelligence Infrastructure-as-Code Generator (AIAC)

## Links

- [Code Repository](https://github.com/gofireflyio/aiac)

## CLI

### Dependencies

- [OpenAI](/openai/README.md)

### Installation

#### Homebrew

```sh
brew tap gofireflyio/aiac
brew install aiac
```

### Commands

```sh
aiac -h
```

### Usage

```sh
#
aiac get terraform for AWS EC2
# with output
aiac -o ./aws_ec2.tf get terraform for AWS EC2

#
aiac get dockerfile for nodejs with comments
```
