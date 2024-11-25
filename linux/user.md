# User

## Usage

```sh
# Show Current
id

# Show all users
users

# Describe
cat /etc/passwd

# Add
sudo useradd <username>

# Password
sudo passwd <username>

# Delete
sudo userdel <username>
sudo rm -r /home/<username>

# Details
getent passwd "$USER"
```
