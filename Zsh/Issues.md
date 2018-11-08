# Issues

## Authentication failure

> chsh: PAM: Authentication failure

```sh
sudo sed -rie '/^auth([ \t]+)required([ \t]+)pam_shells\.so/s/auth/# auth/g' /etc/pam.d/chsh
```
