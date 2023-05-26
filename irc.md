# IRC

## Clients

- [mIRC](/mirc.md)
- [Textual](/textual.md)

<!--
LimeChat
mas install 414030210
-->

## Commands

```sh
# Connect
/server <server>

# Channel
/join <channel>

# List (search)
/list <*keyword*>

# Clear
/clear
```

### Servers

```sh
# freenode
/server irc.freenode.org

# QuakeNet
/server irc.quakenet.org
```

### NickServ

```sh
# Nick
/nick <nickname>

# Register
/msg NickServ REGISTER <password> <email>

# Change Password
/msg NickServ SET PASSWORD <password>

# Change Email
/msg NickServ SET EMAIL <email>

# Status
/msg NickServ STATUS

# Info
/msg NickServ INFO

# Login
/msg NickServ IDENTIFY <nickname> <password>

# Logout
/msg NickServ LOGOUT

# Vacation
/msg NickServ VACATION
```

### ChanServ

```sh
# Register
/msg ChanServ REGISTER <\#channel>

# Operator
/msg ChanServ OP <\#channel>

# User
/msg ChanServ OP <\#channel> <nickname>

# Flags
/msg ChanServ FLAGS <\#channel> <nickname> +oO

# Help
/msg ChanServ HELP
```
