# Laravel Pipeline

<!--
https://github.com/1989car/vaop/blob/master/azure-pipelines.yml
https://github.com/marketredesign/mrd-auth0-laravel/blob/develop/azure-pipelines.yml
https://github.com/vptcoder/GroupBuy-CSIT321/blob/staging/azure-pipelines.yml
https://github.com/marketredesign/mrd-auth0-laravel/blob/develop/azure-pipelines.yml
-->

## Configuration

**Refer:** `./azure-pipelines.yml`

```yml
---
trigger:
  - main

pool:
  vmImage: ubuntu-22.04

steps:
  # ...

  # TODO

  # ...
```

```yml
trigger:
  - master
  - release

variables:
  vmImageName: 'ubuntu-22.04'

stages:
  - stage: Build
    displayName: Build Stage
    variables:
      phpVersion: '8.1'
    jobs:
      - job: BuildJob
        pool:
          vmImage: $(vmImageName)
        steps:
          - script: |
              sudo update-alternatives --set php /usr/bin/php$(phpVersion)
              sudo update-alternatives --set phar /usr/bin/phar$(phpVersion)
              sudo update-alternatives --set phpdbg /usr/bin/phpdbg$(phpVersion)
              sudo update-alternatives --set php-cgi /usr/bin/php-cgi$(phpVersion)
              sudo update-alternatives --set phar.phar /usr/bin/phar.phar$(phpVersion)
              sudo apt-get install php$(phpVersion)-imagick php$(phpVersion)-bcmath php$(phpVersion)-mbstring php$(phpVersion)-curl php$(phpVersion)-gd php$(phpVersion)-zip php$(phpVersion)-dom
              php -version
            displayName: 'Use PHP version $(phpVersion)'

          - script: |
              curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
              sudo apt-get install -y build-essential debconf-utils nodejs
            displayName: 'Installing System Dependencies'

          - script: |
              sudo apt-get -y remove composer
              sudo wget https://getcomposer.org/composer.phar -O /usr/local/bin/composer
              sudo chmod +x /usr/local/bin/composer
              export PATH=$PATH:~/usr/local/bin/
              sudo composer self-update
              composer --version
              composer install --no-interaction --prefer-dist --no-suggest
            displayName: 'Installing Package Dependencies'

          - script: |
              touch database/database.sqlite
              cp .env.example .env
              sed -i 's/DB_CONNECTION=mysql/DB_CONNECTION=sqlite/gi' .env
              sed -i 's/DB_DATABASE=laravel/#DB_DATABASE=laravel/gi' .env
              sed '/DB_CONNECTION=sqlite/ a DB_FOREIGN_KEYS=false' .env
            displayName: 'Setting Up Application Environment'

          - script: |
              php artisan key:generate
              php artisan migrate --force --seed
            displayName: 'Running Migrations'

          - script: |
              sudo npm i -g npm
              sudo chown -R vsts:vsts ~/.npm
              sudo chown -R vsts:vsts ~/.config
              npm install
              npm run production
              node -v
            displayName: 'Generating build assets'

          - script: vendor/bin/phpunit --testdox --verbose --log-junit tests/Results/TEST-phpunit-junit.xml
            displayName: 'Running Unit Test'

          - task: PublishTestResults@2
            inputs:
              testRunner: 'JUnit'
              testResultsFiles: '**/TEST-*.xml'
              searchFolder: '$(System.DefaultWorkingDirectory)/tests/Results'
              mergeTestResults: false
            condition: always()

  - stage: DeployRelease
    displayName: Deploy Release Stage
    dependsOn: Build
    condition: and(succeeded(), eq(variables['build.sourceBranch'], 'refs/heads/release'))
    jobs:
      - job: DeployReleaseJob
        pool:
          vmImage: $(vmImageName)
        steps:
          - script: echo Release
          - task: SSH@0
            inputs:
              sshEndpoint: 'DEN-US-PORTAL Homolog'
              runOptions: 'commands'
              commands: './deploy.sh || true'
              failOnStdErr: false
              readyTimeout: '90000'
```
