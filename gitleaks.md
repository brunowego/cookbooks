# Gitleaks

<!--
https://artifacthub.io/packages/tekton-task/tekton-catalog-tasks/gitleaks
-->

**Keywords:** Secrets Detection, SAST

## Links

- [Code Repository](https://github.com/zricethezav/gitleaks)

## CLI

### Installation

#### Homebrew

```sh
brew install gitleaks
```

#### Unix-like

```sh
GITLEAKS_VERSION="$(curl -s https://api.github.com/repos/zricethezav/gitleaks/releases/latest | grep tag_name | cut -d '"' -f 4 | tr -d 'v')"; \
  curl -L \
    "https://github.com/zricethezav/gitleaks/releases/download/v${GITLEAKS_VERSION}/gitleaks_${GITLEAKS_VERSION}_linux_x64.tar.gz" | \
      tar -xzC /usr/local/bin gitleaks
```

#### Chocolatey

```sh
choco install gitleaks
```

### Commands

```sh
gitleaks -h
```

### Configuration

```sh
#
cat << EOF > ./.gitleaks.toml
title = "Gitleaks Config"

[extend]
useDefault = true
EOF

#
cat << EOF > ./.gitleaksignore
<commit>:<file>:<rule-id>:<line>
EOF
```

### Usage

```sh
#
gitleaks detect \
  --no-banner \
  --redact \
  -v

#
gitleaks protect \
  --staged \
  --no-banner \
  --redact \
  -v
```

### Tips

#### Pre Commit

**Dependencies:** [Git Config Hooks](/git/git-config.md#hooks)

```sh
#
cat << EOF >> ~/.config/git/hooks/pre-commit
if command -v gitleaks >/dev/null; then
  gitleaks protect --staged --redact -v
fi

EOF
```

#### From Pipe

```sh
git log -p | gitleaks detect --pipe
```
