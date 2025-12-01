# Ollama

<!--
PORT: 11434
-->

**Keywords:** LLM

## Links

- [Code Repository](https://github.com/ollama/ollama)
- [Main Website](https://ollama.com)
- [Models](https://ollama.com/library)

## Tools

- [Open WebUI (Formerly Ollama WebUI)](/open-webui.md)

<!-- ## App -->

<!--
cd ~/Library/Application\ Support/Ollama

rm -fR ~/.ollama/models
-->

## CLI

### Installation

```sh
# Homebrew
brew install ollama
```

### Commands

```sh
ollama -h
```

### Usage

```sh
#
ollama serve

#
ollama pull <model> # llama2, llama3, etc.

#
ollama list

#
ollama run <model>
ollama run <model> <text>
```

### Issues

#### TBD

```log
Error: could not connect to ollama app, is it running?
```

TODO
