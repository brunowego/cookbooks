# Zoom

## Links

- [Org. Repository](https://github.com/zoom)
- [Main Website](https://zoom.us/)

## App

### Installation

#### Homebrew

```sh
brew install --cask zoom
```

#### RPM

```sh
curl -LO 'https://zoom.us/client/latest/zoom_x86_64.rpm' && \
  sudo rpm -vi ./zoom_x86_64.rpm && \
    rm -f ./zoom_x86_64.rpm
```

#### DPKG

```sh
curl -LO 'https://zoom.us/client/latest/zoom_amd64.deb' && \
  sudo dpkg -i ./zoom_amd64.deb && \
    rm -f ./zoom_amd64.deb
```

#### Chocolatey

```sh
choco install -y zoom
```
