# Step

**Keywords:**

## CLI

### Links

- [Code Repository](https://github.com/smallstep/cli)
- [Main Website](https://smallstep.com/cli/)

### Installation

#### Homebrew

```sh
brew install step
```

#### Scoop

```sh
scoop bucket add smallstep https://github.com/smallstep/scoop-bucket.git
scoop install smallstep/step
```

### Commands

```sh
step -h
```

### Usage

```sh
#
step certificate inspect https://smallstep.com

#
echo 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c' | \
  step crypto jwt inspect --insecure
```
