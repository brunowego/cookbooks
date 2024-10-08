# Postman

<!--
https://<org>.postman.co/usage/test-data
-->

<!--
https://app.pluralsight.com/course-player?courseId=a609cb66-9343-41bd-87e3-a83514e29e27
https://app.pluralsight.com/library/courses/postman-fundamentals/table-of-contents
https://www.linkedin.com/learning/postman-essential-training
https://www.freecodecamp.org/news/learn-how-to-use-postman-to-test-apis/

https://<name>.postman.co
https://postman.com/<name>
https://<name>.postman.co/settings/team/custom-domains
-->

**Keywords:** API Testing Client

## Links

- [Org. Repository](https://github.com/postmanlabs)
- [Main Website](https://postman.com)
- Browser Extension
  - Postman Interceptor
    - [Google Chrome](https://chromewebstore.google.com/detail/postman-interceptor/aicmkgpgakddgnaphhhpliifpcfhicfo)

## Guides

- [Dynamic variables](https://learning.postman.com/docs/writing-scripts/script-references/variables-list/)

## App

### Installation

#### Homebrew

```sh
brew install --cask postman
```

#### Linux

```sh
#
wget -O - 'https://dl.pstmn.io/download/latest/linux64' | sudo tar -xzC /usr/local --transform s/Postman/postman/

#
sudo chmod +x /usr/local/postman/app/Postman
```

##### Ubuntu Desktop Entry

```sh
#
cat << EOF > ~/Desktop/Postman.desktop
[Desktop Entry]
Name=Postman
GenericName=Postman
Exec=/usr/local/postman/app/Postman %u
Terminal=false
Icon=/usr/local/postman/app/resources/app/assets/icon.png
Type=Application
Categories=Application;Network;X-Developer;
Comment=The collaboration platform for api development
EOF
```

#### Chocolatey

```sh
choco install -y postman
```

### Tips

#### Dark Theme

1. Preferences
2. Themes Tab
   - Select Dark

### Issues

#### TBD

```log
Error: connect ECONNREFUSED 127.0.0.1:13000
```

TODO

## CLI

### Installation

```sh
#
brew install --cask postman-cli
```

### Commands

```sh
postman -h
```

### Initialize

```sh
#
postman login

#
postman logout
```

### Usage

```sh
#
echo '{}' > ./postman_environment.json

#
postman collection run ./postman_environment.json
```

<!--
postman api lint <api>
postman api publish <api-id>
-->
