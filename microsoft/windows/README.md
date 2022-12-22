# Windows

<!--
http://help.market.com.br/frente/index.html?permitir-ping-windows-10.htm
-->

## References

- [Windows 7 ISO](https://microsoft.com/en-us/software-download/windows8ISO)
- [Windows 10 ISO](https://microsoft.com/en-us/software-download/windows10ISO)
- [Windows Subsystem Linux (WSL)](/microsoft/windows/wsl.md)

## Docker

### Dependencies

Docker running on Windows.

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h windows \
  --name windows \
  --network workbench \
  mcr.microsoft.com/windows/nanoserver:ltsc2022 cmd.exe
```

## Tips

### Scan Repair

```sh
sfc /scannow
```

### Create a bootable USB stick

#### Darwin

1. Open "Boot Camp Assistant" -> Continue
2. Select Tasks
   - Check: Create a Windows 10 or later install disk
   - Uncheck: Install Windows 10 or later version
   - Continue
3. Create Bootable USB Driver for Windows Installation
   - ISO image:
   - Destination disk:
   - Continue
4. Quit

#### Using Application

- Rufus (Windows)
- [UNetbootin](/unetbootin.md) (Darwin)
- WoeUSB (Linux)

<!-- ## Issues -->

<!-- ###

```log
A Media driver your computer needs is missing.
```

TODO
-->

<!--
https://downloadcenter.intel.com/pt-br/download/22824/Intel-USB-3-0-eXtensible-Host-Controller-Driver-for-Intel-8-9-100-Series-and-Intel-C220-C610-Chipset-Family

https://answers.microsoft.com/en-us/windows/forum/all/solved-no-way-to-install-windows-10-from-usb-keeps/d9b18f6e-5bb5-4c56-9538-6b95234b3fb2
-->

## Issues

### Uninstall IE 10

```sh
sfc /scannow

FORFILES /P %WINDIR%\servicing\Packages /M Microsoft-Windows-InternetExplorer-*10.*.mum /c "cmd /c echo Uninstalling package @fname && start /w pkgmgr /up:@fname /norestart"
```
