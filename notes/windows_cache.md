---
id: windows_cache
aliases:
  - windows_cache
tags:
  - cache
  - windows
---

# How to clear space on your hard drive on Windows?

1. Copy original folder to another disk
   `Copy-Item "C:\original\folder\*" "D:\new\folder\" -Recurse`
2. Delete original folder
   `Remove-Item "C:\original\folder" -Recurse -Force`
3. (Admin only!) Make a soft link for original folder to new folder
   `New-Item -ItemType SymbolicLink -Path "C:\original\folder" -Target "D:\new\folder"`
