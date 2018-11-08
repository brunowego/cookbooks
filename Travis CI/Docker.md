# Docker

## Running

- [Images](https://quay.io/organization/travisci)

```sh
docker run -d --rm \
  -u travis \
  quay.io/travisci/travis-python /bin/bash
```

```sh
cd ~/builds && git clone https://github.com/travis-ci/travis-build.git ./travis-build && cd "$_"
```

```sh
rvm install 2.5.5
rvm use 2.5.5
```

```sh
gem update --system
gem install travis
travis
bundle install
bundler add travis
bundler binstubs travis
```

https://gist.github.com/fulldecent/d84cd1abdcc6930865d1b862c4aed917
https://medium.com/google-developers/how-to-run-travisci-locally-on-docker-822fc6b2db2e
https://andy-carter.com/blog/setting-up-travis-locally-with-docker-to-test-continuous-integration
