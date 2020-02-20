# OpenSSL

## CLI

### Installation

#### Homebrew

```sh
brew install openssl
```

#### YUM

```sh
yum check-update
sudo yum -y install openssl
```

#### APT

```sh
sudo apt update
sudo apt -y install openssl
```

#### Source

##### Dependencies

###### YUM

```sh
yum check-update
sudo yum -y install zlib-devel
```

###### APT

```sh
sudo apt update
sudo apt -y install zlib1g-dev
```

##### Build & Install

```sh
curl https://www.openssl.org/source/openssl-1.1.1.tar.gz | tar -xz
( cd ./openssl-1.1.1 && ./config --prefix=/usr/local/ssl --openssldir=/usr/local/ssl shared zlib && make && sudo make install ) && rm -r ./openssl-1.1.1
```

<!-- ##### Reload Dynamic Link

```sh
sudo /usr/bin/sh -c 'echo '/usr/local/ssl/lib' > /etc/ld.so.conf.d/openssl-1.1.1.conf'
sudo ldconfig -v
``` -->

<!-- ##### Binaries

###### Backup Current

```sh
sudo mv /usr/bin/c_rehash /usr/bin/c_rehash.bkp
sudo mv /usr/bin/openssl /usr/bin/openssl.bkp
``` -->

<!-- ##### Shell

###### Bash

```sh
echo -e '\n# OpenSSL\nexport PATH="/usr/local/ssl/bin:$PATH"' >> ~/.bashrc
```

```sh
source ~/.bashrc
``` -->

### Configuration

```sh
cat "$(openssl version -d | awk '{print $NF}' | tr -d '"')/openssl.cnf"
```

### Commands

```sh
openssl
```

### Usage

```sh
# Version
openssl version -a

#
echo -n 'Pa$$w0rd!' | openssl md5
```

#### Generate

##### Self-signed Certificate

```sh
sudo mkdir -p /etc/ssl/{certs,private}/example
```

```sh
sudo chmod a+w /etc/ssl/{certs,private}/example
```

```sh
openssl req \
  -out '/etc/ssl/certs/example/root-ca.crt' \
  -nodes \
  -keyout '/etc/ssl/private/example/root-ca.key' \
  -config <(cat $(openssl version -d | awk '{print $NF}' | tr -d '"')/openssl.cnf <(printf '\n[ san ]\nsubjectAltName=DNS:example.com,DNS:*.example.com')) \
  -subj '/C=BR/ST=Sao Paulo/L=Sao Paulo/O=Example Inc./OU=IT Department/CN=*.example.com' \
  -newkey rsa:2048 \
  -x509 \
  -sha256 \
  -days 365 \
  -extensions san
```

```sh
ls /etc/ssl/{certs,private}/example
```

####

```sh
# Certificate signing request (CSR) for an existing private key
openssl req \
  -out [filename].csr \
  -key [filename].key \
  -new

# Certificate signing request based on an existing certificate
openssl x509 \
  -x509toreq \
  -in [filename].crt \
  -out [filename].csr \
  -signkey [filename].key
```

### Show

```sh
openssl x509 \
  -in '/etc/ssl/certs/example/root-ca.crt' \
  -noout \
  -text
```

#### Remove

```sh
# Passphrase from a private key
openssl rsa \
  -in [filename].pem \
  -out [filename].pem
```

#### List certs

```sh
openssl s_client \
  -connect [hostname]:443 \
  -showcerts
```

#### Export

```sh
openssl s_client \
  -connect [hostname]:443 \
  -showcerts \
  -servername [hostname] < /dev/null 2> /dev/null | \
    openssl x509 -outform PEM > [filename].pem
```

#### Convert

##### PEM to DER/CRT

```sh
openssl x509 \
  -inform PEM \
  -in [filename].pem \
  -outform DER \
  -out [filename].[der|crt]
```

##### DER to PEM

```sh
openssl x509 \
  -inform DER \
  -in [filename].der
  -outform PEM \
  -out [filename].pem
```

##### CRT and KEY to PEM

```sh
cat [filename].crt [filename].key > [filename].pem
```

#### Trust

```sh
# Darwin
sudo security add-trusted-cert -d \
  -r trustRoot \
  -k /Library/Keychains/System.keychain [filename].der
```

#### Test

```sh
wget https://[hostname] \
  --no-check-certificate \
  --ca-certificate=[filename].pem

wget https://[hostname] --ca-certificate=[filename].pem
```

### Interpreter

#### Python

```sh
python
```

```python
import ssl
ssl.OPENSSL_VERSION
exit()
```

### Tips

#### Checking

```sh
# Check a Certificate Signing Request (CSR)
openssl req -text -noout -verify -in CSR.csr

# Check a private key
openssl rsa -in privateKey.key -check

# Check a certificate
openssl x509 -in certificate.crt -text -noout

# Check a PKCS#12 file (.pfx or .p12)
openssl pkcs12 -info -in keyStore.p12
```

#### Convert a DER file (.crt .cer .der) to PEM

```sh
openssl x509 -inform der -in certificate.cer -out certificate.pem
```

```sh
# Convert a PEM file to DER
openssl x509 -outform der -in certificate.pem -out certificate.der

# Convert a PKCS#12 file (.pfx .p12) containing a private key and certificates to PEM
openssl pkcs12 -in keyStore.pfx -out keyStore.pem -nodes

# You can add -nocerts to only output the private key or add -nokeys to only output the certificates.
# Convert a PEM certificate file and a private key to PKCS#12 (.pfx .p12)
openssl pkcs12 -export -out certificate.pfx -inkey privateKey.key -in certificate.crt -certfile CACert.crt
```

#### Debugging

```sh
# Check an MD5 hash of the public key to ensure that it matches with what is in a CSR or private key
openssl x509 -noout -modulus -in certificate.crt | openssl md5
openssl rsa -noout -modulus -in privateKey.key | openssl md5
openssl req -noout -modulus -in CSR.csr | openssl md5

# Check an SSL connection. All the certificates (including Intermediates) should be displayed
openssl s_client -connect www.paypal.com:443
```

#### Generate Random

```sh
# Base64
openssl rand -base64 20

# Bexadecimal
openssl rand -hex 32
```

### Issues

#### Zlib Not Available

```log
zipimport.ZipImportError: can’t decompress data; zlib not available
```

```sh
# Darwin
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.*.pkg -target /
```

#### Library not loaded

```log
dyld: Library not loaded: /usr/local/opt/openssl/lib/libcrypto.1.0.0.dylib
  Referenced from: /Users/puss/Library/Caches/electron-builder/winCodeSign/winCodeSign-1.7.0/darwin/osslsigncode
  Reason: image not found
```

```sh
brew install openssl
brew reinstall openssl@1.1

brew switch openssl 1.0.2t
```
