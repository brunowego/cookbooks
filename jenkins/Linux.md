# Linux

## Installation

### YUM ([Original source](http://cvuorinen.net/2013/06/installing-jenkins-ci-server-with-github-integration-for-a-php-project/))

```sh
java -version
```

```sh
sudo yum check-update
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum -y install jenkins
```

```sh
sudo systemctl start jenkins
```

## Alternative

```sh
wget http://pkg.jenkins-ci.org/redhat/jenkins-1.617-1.1.noarch.rpm

sudo rpm -ivh jenkins-1.617-1.1.noarch.rpm
```

Open [http://127.0.0.1:8080](http://127.0.0.1:8080).

## Securing Jenkins

Go to `Manage Jenkins > Configure Global Security > Enable security`.

- [x] Jenkins’ own user database
	- [x] Allow users to sign up
- [x] Logged-in users can do anything

Create an account.

Go to `Manage Jenkins > Configure Global Security > Enable security`.

- [ ] Allow users to sign up

## GitHub integration

Go to `Manage Jenkins > Manage Plugins`, open Available tab and check "GitHub Plugin", now click in "Install without restart". Check "Restart Jenkins when installation is complete and no jobs are running".

Go to `Manage Jenkins > Configure System`, search for "Git installations" and add correct path to git in "Path to Git executable".

```sh
sudo yum check-update
sudo yum -y install git
```

Search for "GitHub Web Hook" and select "Let Jenkins auto-manage hook URLs", add your username and [get a token](https://github.com/settings/tokens).

Open `https://github.com/[company]/[project]/settings/hooks` on Github, in "Services" section click on "Add service" and select "Jenkins (GitHub plugin)", put the url (e.g. `http://192.168.33.11:8080/github-webhook/`) in "Jenkins hook url", now click in save.

## Create a job for the project

Click "New Job", type a title and check "Freestyle project", after it add url of project in "GitHub project" and on "Source Code Management" check "Git". Under "Build Triggers" check "Build when a change is pushed to GitHub" and save.
