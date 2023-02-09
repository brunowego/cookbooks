# Go Get

## Issues

### Private Repository

```log
go: module github.com/<owner>/<repo>: git ls-remote -q origin in /Users/brunowego/.go/1.19.4/pkg/mod/cache/vcs/d271f198b1b321188ae506a8fd2450d845784acd90fa2732f8d6ea40291c6b4a: exit status 128:
  Host key verification failed.
  fatal: Could not read from remote repository.

  Please make sure you have the correct access rights
  and the repository exists.
```

```sh
#
go env -w GOPRIVATE='github.com/<owner>'

#
go get -x -v github.com/<owner>/<repo>
```

<!--
cat ~/.netrc
-->
