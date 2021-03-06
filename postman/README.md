# Postman

<!--
https://app.pluralsight.com/course-player?courseId=a609cb66-9343-41bd-87e3-a83514e29e27

https://app.pluralsight.com/library/courses/postman-fundamentals/table-of-contents

https://linkedin.com/learning/postman-essential-training/why-automate-your-api-tests
-->

## Alternatives

- [SoapUI](/soapui.md)

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
