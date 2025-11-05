# QPDF

**Keywords:** PDF Checker

## CLI

### Installation

```sh
# Using Homebrew
brew install qpdf

# Using APT
sudo apt -y install qpdf
```

### Usage

```sh
# Check if the PDF is valid
qpdf --check <filename>.pdf

# Remove password
qpdf --password=<password> --decrypt ./<input>.pdf ./<output>.pdf
```

### Tips

#### 10 first pages

```sh
qpdf ./<input>.pdf --pages . 1-10 -- ./<output>.pdf
```
