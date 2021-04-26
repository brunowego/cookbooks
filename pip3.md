# Python Package Index (PIP3)

## References

- [Configuration](https://pip.pypa.io/en/stable/user_guide/#configuration)
- [install_requires vs requirements files](https://packaging.python.org/discussions/install-requires-vs-requirements/)

## CLI

### Installation

#### YUM

```sh
yum check-update

# Repo: EPEL
sudo yum -y install python36-pip
```

#### APT

```sh
sudo apt update
sudo apt -y install python3-pip
```

#### APK

```sh
sudo apk update
sudo apk add py3-setuptools
```

### Commands

```sh
pip3 -h
```

### Upgrade

```sh
pip3 install -U pip
```

### Usage

```sh
# Installed packages
pip3 list

# Install setup.py
pip3 install ./

#
python3 -m pip3 install ./

# Install compressed file
pip3 install [/path/to/package.tar.gz]
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# PIP Binary Path
export PATH="$HOME/.local/bin:$PATH"
```

```sh
sudo su - "$USER"
```

### Configuration

#### Requirements

```sh
cat << EOF >> ./requirements-dev.txt

EOF

cat << EOF >> ./requirements.txt

EOF
```

```sh
pip3 install \
  -r ./requirements-dev.txt \
  -r ./requirements.txt
```

#### Directly from GitHub

```txt
git+https://github.com/[user]/[repo].git@master#egg=[repo]
git+git://github.com/[user]/[repo]@master#egg=[repo]
```

#### External Mirror

```sh
export PIP_CONFIG_FILE=/etc/pip.conf

# or
mkdir -p "$HOME/.config/pip"
export PIP_CONFIG_FILE="$HOME/.config/pip/pip.conf"
```

```sh
cat << EOF > "$PIP_CONFIG_FILE"
[global]
index-url = https://mirror.example.com/simple
extra-index-url = https://mirror.example.org/simple

[install]
trusted-host =
  mirror.example.com
  mirror.example.org

EOF
```

```sh
pip3 config list
```

### Tips

#### Command-line completion

```sh
# Using Antigen
antigen bundle pip
```

#### Setuptools

```sh
# pip3 install ./
# pip3 install -e ./

python3 ./setup.py install
python3 ./setup.py develop
python3 ./setup.py check --restructuredtext --metadata --strict
python3 ./setup.py build
python3 ./setup.py clean --all
```

### Issues

#### Permission Denied

```log
PermissionError: [Errno 13] Permission denied: '/usr/local/lib/python3.6/site-packages/[package-name]'
PermissionError: [Errno 13] Permission denied: '/usr/lib/python3.6/site-packages/[package-name]'
```

```sh
#
pip3 install --user [package]
```

<!-- #### Package Finder

```log
ImportError: cannot import name 'PackageFinder' from 'pip._internal.index' (/usr/lib/python3.8/site-packages/pip/_internal/index/__init__.py)
```

```sh
python3 -m ensurepip --upgrade
``` -->

#### Clang

```log
error: command '/usr/bin/clang' failed with exit code 1
```

```sh
export CC=gcc
export CXX=clang

pip3 install -r ./requirements.txt
```

#### GCC

```log
error: command '/usr/bin/gcc' failed with exit code 1
```

Switch to Python 3.8.6

#### SSL Certificate Verify Failed

```log
ERROR: Could not install packages due to an EnvironmentError: HTTPSConnectionPool(host='files.pythonhosted.org', port=443): Max retries exceeded with url: /packages/a1/b4/ae4cacbae2c1ad8179c589847e03c762abd65b905d13ae9413f749a71591/coverage-5.0.3-cp38-cp38-macosx_10_13_x86_64.whl (Caused by SSLError(SSLCertVerificationError(1, '[SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: self signed certificate in certificate chain (_ssl.c:1108)')))
```

```sh
# Using globally file
cat << EOF | sudo tee /etc/pip.conf
[global]
trusted-host =
  pypi.org
  files.pythonhosted.org
EOF

# Or, using user file
mkdir -p ~/.pip

cat << EOF > ~/.pip/pip.conf
[global]
trusted-host =
  pypi.org
  files.pythonhosted.org
EOF

# Or, using trust host
pip3 install \
  --trusted-host pypi.org \
  --trusted-host files.pythonhosted.org \
  coverage

# Or, using environment variable
export PIP_TRUSTED_HOST='pypi.org files.pythonhosted.org'
```

```sh
# Or, try upgrade certificates
pip3 install --upgrade certifi
```

## Dockerfile

### Tips

```Dockerfile
COPY ./requirements.txt /usr/src/[appname]

RUN if [ -s /usr/src/[appname]/requirements.txt ]; then pip3 install -r /usr/src/[appname]/requirements.txt; fi
```

```sh
cat << EOF > ./requirements.txt
# Add plugins here
EOF
```
