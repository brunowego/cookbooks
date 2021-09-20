# Perl

<!--
cpan

https://linkedin.com/learning/perl-5-essential-training/welcome
-->

## CLI

### Installation

#### Homebrew

```sh
brew install perl
```

### Usage

```sh
# Version
perl --version | head -2 | tail -1
```

### Tips

#### Change Backend URL

```sh
#
export BACKEND_URL=''

#
perl -pi -e "s#http://127.0.0.1:8080#$BACKEND_URL#g" [/path/to/files/*.js]
```
