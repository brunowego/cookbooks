# Google Mail (gmail)

## Tips

<!-- ### Less Secure Apps

https://myaccount.google.com/lesssecureapps?pli=1 -->

### Mail Password

1. [Google Account](https://myaccount.google.com/)
2. Security
3. App passwords
4. Select the app and device you want to generate the app password for.
   - Select app: Mail
   - Select device: Other (Custom name) -> Terminal on my Mac
   - Generate
5. Your app password for your device
   - Copy
   - Done

### Force Specific Network Interface

```sh
# List
netstat -rn | grep -i default

# Route Info
route get gmail.com
ping rio01s15-in-f69.1e100.net

# Add Route
sudo route add 216.58.222.69 172.20.10.1

#
netstat -rn | grep -i 216.58.222.69

# Check Route
route get gmail.com

# Delete
sudo route delete 216.58.222.69 172.20.10.1
```

## Test

### Send Email

```sh
openssl s_client \
  -connect smtp.gmail.com:587 \
  -ign_eof \
  -starttls smtp
```

```txt
EHLO smtp.gmail.com
AUTH LOGIN
```

```sh
echo -n '[uername]@gmail.com' | openssl base64
echo -n '[password]' | openssl base64
```

```txt
MAIL FROM: <noreply@example.com>
RCPT TO: <[username]@gmail.com>
DATA
Subject: Sending an email using telnet

Hello,
This is an email sent by using the telnet command.

Your friend,
Me!
.
QUIT
```

## Issues

### Proxy

Bypass external proxies for the following hosts:

```txt
*.gmail.com
```
