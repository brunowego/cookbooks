# LiteLLM

**Keywords:** Proxy Server (LLM Gateway), OpenAI Format

## Links

- [Code Repository](https://github.com/BerriAI/litellm)
- [Main Website](https://litellm.ai)
- [Docs](https://docs.litellm.ai/docs)

## Providers

- Cohere
- OpenAI
- PaLM 2

## CLI

### Prerequisites

- [pipx](/pipx.md)

### Installation

```sh
pipx install litellm
pipx install --force 'litellm[proxy]'
```

### Configuration

```sh
pipx environment
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshenv`:

```sh
# pipx Binary Path
export PATH="$HOME/.local/bin:$PATH"
```

```sh
sudo su - "$USER"
```

### Commands

```sh
litellm --help
```

### Tips

**Dependencies:** [Ollama](/ollama/README.md)

```sh
#
ollama pull llama3

#
litellm --model ollama/llama3

#
curl \
  --location 'http://127.0.0.1:4000/chat/completions' \
  --header 'Content-Type: application/json' \
  --data '{
    "model": "gpt-3.5-turbo",
    "messages": [
      {
        "role": "user",
        "content": "what llm model are you and what version?"
      }
    ]
  }'
```
