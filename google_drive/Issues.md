# Issues

## Icon fix

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

Sky Drive did solve this issue (for them at least) by adding a space as prefix in order to have precedence on others.
