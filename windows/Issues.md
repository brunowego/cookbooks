# Issues

## Uninstall IE 10

```sh
sfc /scannow

FORFILES /P %WINDIR%\servicing\Packages /M Microsoft-Windows-InternetExplorer-*10.*.mum /c "cmd /c echo Uninstalling package @fname && start /w pkgmgr /up:@fname /norestart"
```
