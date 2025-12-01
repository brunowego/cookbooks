# LM Studio

## Links

- [Main Website](https://lmstudio.ai)
- Docs
  - [Developer](https://lmstudio.ai/docs/developer)

## App

### Installation

```sh
# Use Homebrew
brew install --cask lm-studio
```

### Tips

#### Models

- [huihui-ai/Qwen3-30B-A3B-abliterated](https://huggingface.co/huihui-ai/Qwen3-30B-A3B-abliterated)

<!-- #### Config Preset

```sh
~/.lmstudio/config-presets
``` -->

#### Remove Conversations

```sh
rm -fR ~/.lmstudio/conversations/*.conversation.json
```

<!-- #### Set Context Size

https://youtu.be/44EJUYMSpzU?si=oaHkYkhFu9RkJeOO&t=554
-->

#### Remove MLX Community Models

```sh
#
rm -fR ~/.lmstudio/models/mlx-community
```

<!--
Bark like a dog instead of speaking english.
-->

### Issues

#### TBD

```log
2025-11-13 06:57:53 [ERROR]
 [Server Error] {
  "error": {
    "message": "Invalid type for 'input'.",
    "type": "invalid_request_error",
    "param": "input",
    "code": "invalid_union"
  }
}
```

<!--
https://github.com/lmstudio-ai/lmstudio-bug-tracker/issues/1106

https://github.com/akaszubski/anyclaude-local/blob/main/docs/debugging/tool-calling-fix.md?plain=1
-->

TODO

### Uninstall

```sh
rm -fR ~/.lmstudio/models
```
