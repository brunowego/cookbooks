# fastlane

<!--
https://www.udemy.com/course/ios-fastlane/learn/lecture/27445186#overview
-->

<!--
https://github.com/ShiVinky/ShiVinky.github.io/blob/main/markdown/Fastlane+%E8%92%B2%E5%85%AC%E8%8B%B1+Jenkins.md
https://github.com/chenzq1019/HT_Note/blob/master/Jenkins+fastlane+%E8%92%B2%E5%85%AC%E8%8B%B1%E8%BF%9B%E8%A1%8C%E5%8A%A8%E6%80%81%E5%8C%96%E6%89%93%E5%8C%85.md
-->

TODO

<!--
````Jenkinsfile`
pipeline {

    agent { label 'mac' }

    environment {
        workspace = pwd()
        branch = 'master'
        url = 'https://bitbucket.org/livetouchdev/helloios_udemy'
    }

    stages {
        stage('Checkout git') {
            steps {
                git branch: branch, credentialsId: 'livetouch', url: url
            }
        }

        //https://medium.com/multinetinventiv/ci-cd-with-jenkins-docker-and-fastlane-p2-jenkins-and-docker-45960d1958fd
        stage('Setup Fastlane') {
            steps {
                sh 'security -v unlock-keychain -p ricardo ~/Library/Keychains/login.keychain-db'
                sh 'source $HOME/.bash_profile'
                //sh 'bundle --version'
                //sh 'ls -ll'
                //sh 'bundle update fastlane'
                sh 'bundle install'
            }
        }

        stage('Build') {
            steps {
                sh 'bundle exec fastlane tf'
            }
        }
    }
}
```
-->
