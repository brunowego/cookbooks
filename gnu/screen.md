# GNU Screen

## Alternatives

- [tmux](/tmux.md)

## CLI

### Installation

#### Homebrew

```sh
brew install screen
```

#### APT

```sh
sudo apt update
sudo apt -y install screen
```

#### YUM

```sh
yum check-update
sudo yum -y install screen
```

<!-- ### Configuration

```sh
cat << EOF > ~/.screenrc
hardstatus off
hardstatus alwayslastline
hardstatus string '%{= kG}[%{G}%H%? %?%{g}][%= %{= kw}%-w%{+b yk} %n*%t%?(%u)%? %{-}%+w %=%{g}][%{B}%Y-%m-%d %{W}%c%{g}]'

windowlist string "%4n %h%=%f"

startup_message off
vbell off

term st-256color
EOF
``` -->

### Commands

```sh
screen -h
```

### Usage

```sh
# New Session
screen -S [session_name]

# List
screen -ls

# Detach: Ctrl + a d

# Reattach
screen -r [session_id]
screen -x [session_id]

# Quit
screen -X quit

# with session id
screen \
  -S [session_id] \
  -X quit
```

## Kubernetes

### Running

```sh
# Ubuntu
kubectl run -it --rm \
  screen-test \
  --image docker.io/library/ubuntu:20.04 \
  -l 'app=screen-test' \
  -- /bin/sh -c 'apt update && apt -y install screen; /bin/bash'
```
