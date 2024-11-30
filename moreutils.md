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

```sh
# Using Homebrew
brew install moreutils

# Using APT
sudo apt update
sudo apt -y install moreutils

# Using YUM
yum check-update

# Repo: EPEL
sudo yum -y install moreutils

# Using Zypper
sudo zypper refresh
sudo zypper install -y moreutils
```

### Conflicts

```sh
# Wish GNU Core Utilities
brew link --overwrite moreutils
```
