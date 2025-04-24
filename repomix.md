# Repomix (formerly Repopack)

**Keywords:** Files to LLM Prompt

## Links

- [Code Repository](https://github.com/yamadashy/repomix)

## CLI

### Installation

```sh
# Using Homebrew
brew install repomix
```

### Configuration

```sh
#
cat << EOF >> ~/.gitignore_global
/.repomix
/repomix-output.txt
EOF
```

### Usage

```sh
repomix ./<path/to/repo>
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension DorianMassoulier.repomix-runner
```
