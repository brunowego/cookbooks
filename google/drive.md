# Google Drive

<!--
https://support.google.com/a/answer/6115117?product_name=UnuFlow&hl=en&visit_id=638083457333861598-3006518330&rd=1&src=supportwidget0&hl=en
-->

## Links

- [Admin Console / Storage](https://admin.google.com/ac/storage)
- [Main Website](https://drive.google.com)

## App

### Installation

#### Homebrew

```sh
brew install --cask google-drive
```

#### Chocolatey

```sh
choco install google-drive-file-stream
```

<!-- ### Issues

### Icon fix

For Windows 8 & 8.1 do the following

1. Run regedit.exe
2. Go to HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers\
    - Prefix a space " " to all items starts with GDrive
    - "GDriveBlacklistedOverlay" to " GDriveBlacklistedOverlay"
    - "GDriveSharedEditOverlay" to " GDriveSharedEditOverlay"
    - "GDriveSharedViewOverlay" to " GDriveSharedViewOverlay"
    - "GDriveSyncedOverlay" to " GDriveSyncedOverlay"
    - "GDriveSyncingOverlay" to " GDriveSyncingOverlay"

Restart the machine (or restart Explorer service from Task Manager)

This is due to the limitations of the operating system to only load limited different overlays at one time. The issue will only arise if there are already 8+ on the system, which in general been used by SKyDrive (3) and SkyDrivePro (3).

Sky Drive did solve this issue (for them at least) by adding a space as prefix in order to have precedence on others. -->
