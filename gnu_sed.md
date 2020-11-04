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

*Note: Remove square brackets.*

#### Replace

```sh
sed 's/[pattern]/[text]/' [/path/to/file]
```

##### Global

```sh
sed 's/[pattern]/[text]/g' [/path/to/file]
```

##### Multiple

```sh
sed 's/[pattern]/[text]/; s/[pattern]/[text]/' [/path/to/file]
```

##### With Regex

```sh
sed -ri '/[pattern]/ s/[original]/[text]/' [/path/to/file]
```

#### Prepend

```sh
sed '/[pattern]/i [text]' [/path/to/file]
```

#### Append

```sh
sed '/[pattern]/a [text]' [/path/to/file]
```

#### Before

```sh
sed 's/[pattern]/& [text]' [/path/to/file]
```

#### After

```sh
sed 's/[pattern]/[text] &' [/path/to/file]
```

####

```sh
sed s/[pattern]/[text]/ [/path/to/file.template] > [/path/to/file]
```

####

```sh
sed '/^[attr] =/s/= .*/= [value]/' [/path/to/file]
```

####

```sh
sed '1s/^/[text]/' [/path/to/file]
```

#### Remove Comment

```sh
sed 's/#\([attribute]:\)/\1/g' [/path/to/file]

# Add value
sed 's/#\([attribute]:\)/\1 [value]/g' [/path/to/file]
```

#### Remove

##### Line

```sh
sed '1d' ~/.ssh/known_hosts
```
