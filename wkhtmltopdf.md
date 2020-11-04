# wkhtmltopdf

## CLI

### Installation

#### Homebrew

```sh
brew cask install wkhtmltopdf
```

#### APT

```sh
sudo apt update
sudo apt install -y wkhtmltopdf xvfb
```

### Configuration

```sh
# Linux
echo 'xvfb-run --server-args="-screen 0, 1024x768x24" /usr/bin/wkhtmltopdf $*' | \
  sudo tee /usr/bin/wkhtmltopdf.sh > /dev/null

sudo chmod a+x /usr/bin/wkhtmltopdf.sh

sudo ln -s /usr/bin/wkhtmltopdf.sh /usr/local/bin/wkhtmltopdf
```

### Usage

```sh
wkhtmltopdf http://www.example.com example.pdf
```
