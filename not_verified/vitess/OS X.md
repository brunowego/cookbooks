# Darwin

##

https://vitess.io/docs/tutorials/local/

```sh
brew install pkg-config

brew install go automake libtool python git bison curl wget mysql56
pip install --upgrade pip setuptools
pip install virtualenv MySQL-python tox

export PATH="$(brew --prefix mysql@5.6)/bin:$PATH"
export PATH=/usr/local/go/bin:$PATH
export GOROOT=/usr/local/go

export GODEBUG=netdns=go

git clone https://github.com/vitessio/vitess.git vitess && cd "$_"

mysqld --version

export MYSQL_FLAVOR=MySQL56
export VT_MYSQL_ROOT=$(brew --prefix mysql@5.6)

pip install virtualenv

./bootstrap.sh

source ./dev.env

make build
```
