# g++

## Related

- [GCC, the GNU Compiler Collection (gcc)](/gcc.md)

## CLI

### Installation

#### APT

```sh
sudo apt update
sudo apt -y install g++
```

#### YUM

```sh
yum check-update

#
sudo yum -y install gcc-c++

# Repo: Software Collections
sudo yum -y install devtoolset-7-gcc-c++
scl enable devtoolset-7 "$SHELL"
sudo /usr/bin/sh -c 'echo "source scl_source enable devtoolset-7" >> /etc/profile.d/scl.sh'
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y gcc-c++
```

### Usage

```sh
# Version
g++ --version | head -1
```

### Issues

#### Missing GCC

```log
gcc: error trying to exec 'cc1plus': execvp: No such file or directory
error: command 'gcc' failed with exit status 1
```

Just install g++.
