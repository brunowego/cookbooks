# HTTPie

**Keywords:** API Testing Client

## Links

- [Main Website](https://httpie.io)

## CLI

### Installation

#### Homebrew

```sh
brew install httpie
```

#### APT

```sh
sudo apt update
sudo apt -y install httpie
```

#### YUM

```sh
yum check-update

# Repo: EPEL
sudo yum -y install httpie
```

### Commands

```sh
http --help
```

### Usage

```sh
#
http httpie.org
http :8080/health-check

#
http GET http://httpbin.org/get

#
http https://jsonplaceholder.typicode.com/posts userId==1

#
http example.org X-Foo:Bar Sample:Value

#
http POST https://jsonplaceholder.typicode.com/posts title=foo body=bar userId:=9

#
http DELETE https://jsonplaceholder.typicode.com/posts/1
```
