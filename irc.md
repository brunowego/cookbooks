# IRC

## Commands

### Connect

```sh
/server [server]
```

### Channel

```sh
/join [channel]
```

### List (search)

```sh
/list [*keyword*]
```

### Clear

```sh
/clear
```

## Servers

### freenode

```sh
/server irc.freenode.org
```

### QuakeNet

```sh
/server irc.quakenet.org
```

## NickServ

### Nick

```sh
/nick [nickname]
```

### Register

```sh
/msg NickServ REGISTER [password] [email]
```

### Change Password

```sh
/msg NickServ SET PASSWORD [password]
```

### Change Email

```sh
/msg NickServ SET EMAIL [email]
```

### Status

```sh
/msg NickServ STATUS
```

### Info

```sh
/msg NickServ INFO
```

### Login

```sh
/msg NickServ IDENTIFY [nickname] [password]
```

### Logout

```sh
/msg NickServ LOGOUT
```

### Vacation

```sh
/msg NickServ VACATION
```

## ChanServ

### Register

```sh
/msg ChanServ REGISTER [\#channel]
```

### Operator

```sh
/msg ChanServ OP [\#channel]
```

#### User

```sh
/msg ChanServ OP [\#channel] [nickname]
```

### Flags

```sh
/msg ChanServ FLAGS [\#channel] [nickname] +oO
```

### Help

```sh
/msg ChanServ HELP
```
