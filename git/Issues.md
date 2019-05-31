# Git

## Certificate

> SSL certificate problem: unable to get local issuer certificate

```sh
git config --global http.sslVerify false
```

## Received HTTP code 502 from proxy after CONNECT

> Received HTTP code 502 from proxy after CONNECT

```sh
git config --global --unset http.sslVerify
```

## RPC failed

> error: RPC failed; result=22, HTTP code = 411

```sh
git config http.postBuffer 524288000
```

## Editor Issue

Output message after run `git commit --amend`:

> error: Terminal is dumb, but EDITOR unset
> Please supply the message using either -m or -F option.

Solve this issue setting the `core.editor` value:

```sh
git config --global core.editor [value]
```

> Use `vim`, `atom --wait`, `subl -n -w` and `mate -w`.

```sh
export GIT_EDITOR=vim
```

## Push

> error: src refspec project does not match any.
> error: failed to push some refs to 'project@domain.com:project'

```sh
git push -u origin master
```
