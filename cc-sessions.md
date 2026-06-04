# cc-sessions

## Links

- [Code Repository](https://github.com/chronologos/cc-sessions)

## CLI

### Installation

```sh
# Using cURL (MacOS)
curl -L https://github.com/chronologos/cc-sessions/releases/latest/download/cc-sessions-macos-arm64 -o ~/.local/bin/cc-sessions

chmod +x ~/.local/bin/cc-sessions

xattr -cr ~/.local/bin/cc-sessions && codesign -s - -f ~/.local/bin/cc-sessions
```

### Commands

```sh
cc-sessions -h
```

### Usage

```sh
# List mode (non-interactive table)
cc-sessions --list

# Filter by project name (case-insensitive)
cc-sessions --project dotfiles
```

<!--
# Fork mode - creates new session ID instead of resuming
cc-sessions --fork

# Show session ID prefixes (works in interactive mode too)
cc-sessions --debug

# List 30 sessions
cc-sessions --list --count 30

# List with session IDs and stats
cc-sessions --list --debug

# List mode including forked sessions
cc-sessions --list --include-forks
-->
