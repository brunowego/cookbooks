# claude-history

## Links

- [Code Repository](https://github.com/raine/claude-history)

## CLI

### Dependencies

- [fzf](/fzf.md)

### Installation

```sh
# Using Homebrew
brew tap raine/claude-history
brew install claude-history

# Using Cargo
cargo install claude-history
```

### Commands

```sh
claude-history -h
```

### Usage

```sh
# Show tool calls in the conversation output
claude-history -t

# Print the conversation directory path and exit
claude-history -d

# Show the last messages in the fuzzy finder preview
claude-history -l

# Show the first messages in the fuzzy finder preview
claude-history -f

# Display relative time (e.g. "10 minutes ago")
claude-history -r

# Display absolute timestamp
claude-history -a

# Show thinking blocks in the conversation output
claude-history -s
```

### Issues

#### TBD

```log
Error: Failed to run fzf: No such file or directory (os error 2)
```

TODO
