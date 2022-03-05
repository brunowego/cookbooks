# DeepSource

## Dependencies

- [DeepSource](/deepsource.md)

## Configuration

**Refer:** `./.deepsource.toml`

```toml
version = 1

test_patterns = ["*/test/**"]

[[analyzers]]
name = "javascript"
enabled = true

  [analyzers.meta]
  plugins = ["react"]

[[analyzers]]
name = "shell"
enabled = true
```
