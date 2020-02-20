# procps

- free - Report the amount of free and used memory in the system
- kill - Send a signal to a process based on PID
- pgrep - List processes based on name or other attributes
- pkill - Send a signal to a process based on name or other attributes
- pmap - Report memory map of a process
- ps - Report information of processes
- pwdx - Report current directory of a process
- skill - Obsolete version of pgrep/pkill
- slabtop - Display kernel slab cache information in real time
- snice - Renice a process
- sysctl - Read or Write kernel parameters at run-time
- tload - Graphical representation of system load average
- top - Dynamic real-time view of running processes
- uptime - Display how long the system has been running
- vmstat - Report virtual memory statistics
- w - Report logged in users and what they are doing
- watch - Execute a program periodically, showing output fullscreen

## Installation

### YUM

```sh
yum check-update
sudo yum -y install procps-ng
```

### APT

```sh
sudo apt update
sudo apt -y install procps
```
