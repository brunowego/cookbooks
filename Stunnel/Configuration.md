# Configuration

```sh
( cd /usr/local/etc/stunnel && sudo cp stunnel.conf-sample stunnel.conf)
```

```sh
sudo sed -ri "s/^;include = (.*)/include = \1/g" /usr/local/etc/stunnel/stunnel.conf
```

> Remove or comment `[gmail-pop3]`, `[gmail-imap]` and `[gmail-smtp]` from `/usr/local/etc/stunnel/stunnel.conf`

```sh
sed -i '62,69 s/^/;/' /usr/local/etc/stunnel/stunnel.conf
sed -i '71,78 s/^/;/' /usr/local/etc/stunnel/stunnel.conf
sed -i '80,87 s/^/;/' /usr/local/etc/stunnel/stunnel.conf
```

```sh
stunnel
```
