# moreutils

## CLI

### References

- `chronic`: runs a command quietly unless it fails
- `combine`: combine the lines in two files using boolean operations
- `errno`: look up errno names and descriptions
- `ifdata`: get network interface info without parsing ifconfig output
- `ifne`: run a program if the standard input is not empty
- `isutf8`: check if a file or standard input is utf-8
- `lckdo`: execute a program with a lock held
- `mispipe`: pipe two commands, returning the exit status of the first
- `parallel`: run multiple jobs at once
- `pee`: tee standard input to pipes
- `sponge`: soak up standard input and write to a file
- `ts`: timestamp standard input
- `vidir`: edit a directory in your text editor
- `vipe`: insert a text editor into a pipe
- `zrun`: automatically uncompress arguments to command

### Installation

#### Homebrew

```sh
brew install moreutils
```

#### APT

```sh
sudo apt update
sudo apt -y install moreutils
```

#### YUM

```sh
yum check-update

# Repo: EPEL
sudo yum -y install moreutils
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y moreutils
```
