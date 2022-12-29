# tmux

## Alternatives

- [GNU Screen](/gnu/screen.md)

## Links

- [Code Repository](https://github.com/tmux/tmux)

## CLI

### Installation

#### Homebrew

```sh
brew install tmux
```

#### APT

```sh
sudo apt update
sudo apt -y install tmux
```

#### YUM

```sh
yum check-update
sudo yum -y install tmux
```

### Commands

```sh
man tmux
```

### Usage

```sh
#
tmux list-sessions

#
tmux new-session -s '[name]'

#
tmux attach -t '[name]'

#
tmux kill-server

#
tmux kill-session -t '[name]'
```
