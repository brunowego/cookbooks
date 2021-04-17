# Symlink

Creation of symbolic links requires the SeCreateSymbolicLinkPrivilege (“Create symbolic links”), which is granted only to administrators by default (but you can change that using security policy).

1. Launch secpol.msc via Start or Start → Run
2. Open Security Settings → Local Policies → User Rights Assignment
3. In the list, find the "Create symbolic links" item, which represents SeCreateSymbolicLinkPrivilege.
4. Double-click on the item and add yourself (or the whole Users group) to the list.

The changes will apply when you log out and log in again.

## Enable symbolic

The symbolic link cannot be followed because its type is disabled

```sh
fsutil behavior query SymlinkEvaluation
```

```sh
fsutil behavior set SymlinkEvaluation R2R:1
fsutil behavior set SymlinkEvaluation L2L:1 R2R:1 L2R:1 R2L:1
```

```sh
fsutil behavior query SymlinkEvaluation
```
