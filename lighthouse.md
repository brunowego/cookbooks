# Lighthouse

## CLI

### Installation

#### NPM

```sh
npm install lighthouse -g
```

### Commands

```sh
lighthouse --help
```

### Usage

```sh
#
lighthouse http://example.com \
  -G

#
lighthouse http://example.com \
  -A

#
lighthouse http://example.com \
  -GA

#
lighthouse http://localhost:3000/docs/ \
  --chrome-flags='--ignore-certificate-errors' \
  --view
```

### Configuration

```sh
# Git ignore
cat << EOF >> ~/.gitignore_global
/latest-run
/*.report.html
EOF
```

###

```sh
cat << EOF > ./lighthouserc.js

EOF
```

```sh
npm install -g @lhci/cli
npm install -g serve

npm run build

openssl req \
  -batch \
  -newkey rsa:2048 \
  -new \
  -nodes \
  -x509 \
  -days 365 \
  -keyout ./key.pem \
  -out ./cert.pem \
  -subj '/C=BR/ST=Sao Paulo/L=Sao Paulo/O=Example Inc./OU=IT Department/CN=*.example.com' \

lhci autorun
```
