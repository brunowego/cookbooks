# GNU sed

## CLI

### Installation

#### Homebrew

```sh
brew install gnu-sed
```

#### APT

```sh
sudo apt update
sudo apt -y install sed
```

#### YUM

```sh
yum check-update
sudo yum -y install sed
```

### Environment

#### Homebrew

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# GNU sed
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
```

```sh
sudo su - "$USER"
```

### Usage

_Note: Remove square brackets._

```sh
# Replace
sed 's/<pattern>/<text>/' </path/to/file>

# Global
sed 's/<pattern>/<text>/g' </path/to/file>

# Multiple
sed 's/<pattern>/<text>/; s/<pattern>/<text>/' </path/to/file>

# With Regex
sed -ri '/<pattern>/ s/<original>/<text>/' </path/to/file>

# Line Before
sed '/<pattern>/i <text>' </path/to/file>

# Line After
sed '/<pattern>/a <text>' </path/to/file>

#
sed 's/<pattern>/<text>/' </path/to/file.template> > \
  </path/to/file>

#
sed '/^<attr> =/ s/= .*/= <value>/' </path/to/file>

#
sed '1s/^/<text>/' </path/to/file>

# Remove Comment
sed 's/#\(<attribute>:\)/\1/g' </path/to/file>

# Add Value
sed 's/#\(<attribute>:\)/\1 <value>/g' </path/to/file>

# Remove Line
sed '1d' ~/.ssh/known_hosts

#
docker exec -i <name> /bin/sh << EOSHELL
sed -i 's/<pattern>/<text>/' </path/to/file>
EOSHELL

# With Backup
sed -i.old 's/<pattern>/<text>/' </path/to/file>
```
