# Render

<!--
https://github.com/acao/trpc-example-sse-craft/blob/main/render.yaml
-->

**Keywords:** Cloud Application Platform; PaaS

## Links

- [Main Website](https://render.com)
- Docs
  - [Native Runtimes](https://docs.render.com/native-runtimes)
  - [Setting Your Node.js Version](https://docs.render.com/node-version)

## CLI

### Installation

```sh
# Using Homebrew
brew tap render-oss/render
brew install render
```

### Commands

```sh
render -h
```

### Configuration

```sh
#
render config init

#
cat ~/.render/config.yaml

#
render config profiles
render config schema
```

### Usage

```sh
#
render dashboard
```

### Tips

#### Autocomplete

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Render
source <(render completions zsh) # bash
```

```sh
source ~/.zshrc
```

### Issues

#### TBD

```log
==> No open ports detected, continuing to scan...
==> Docs on specifying a port: https://render.com/docs/web-services#port-binding
```

TBD

#### TBD

```log
MongoNetworkError: 80ECAD96ED700000:error:0A000438:SSL routines:ssl3_read_bytes:tlsv1 alert internal error:../deps/openssl/openssl/ssl/record/rec_layer_s3.c:1590:SSL alert number 80
```

<!--
ERR_SSL_TLSV1_ALERT_INTERNAL_ERROR

https://medium.com/@pratikpatel17791/how-to-solve-reason-tlsv1-alert-internal-error-code-err-ssl-tlsv1-alert-internal-error-715f3c03c11f
https://stackoverflow.com/questions/78449285/getting-an-error-while-uploading-my-code-over-render-com
-->

<!--
Network Access
IP Access List
Edit
Allow Access From Anywhere
-->

TODO
