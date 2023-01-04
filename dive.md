# dive

**Keywords:** Inspect Docker Image

## CLI

### Installation

#### Homebrew

```sh
brew install dive
```

#### DPKG

```sh
curl -LO 'https://github.com/wagoodman/dive/releases/download/v0.6.0/dive_0.6.0_linux_amd64.deb'
sudo apt -y install ./dive_0.6.0_linux_amd64.deb && rm ./dive_0.6.0_linux_amd64.deb
```

#### RPM

```sh
curl -LO 'https://github.com/wagoodman/dive/releases/download/v0.6.0/dive_0.6.0_linux_amd64.rpm'
sudo rpm -i ./dive_0.6.0_linux_amd64.rpm && rm ./dive_0.6.0_linux_amd64.rpm
```

#### Chocolatey

```sh
choco install -y dive
```

### Configuration

```sh
# Git ignore
echo '/dive.log' >> ~/.gitignore_global
```

### Commands

```sh
dive <image>
```
