# Commands
- Создание переменных окружения
  ```powershell
  [System.Environment]::SetEnvironmentVariable("DOTFILES", "D:\dotfiles", "User")
  [System.Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME", "D:\dotfiles\neovim", "User")
  ```

# PowerShell
- `settings.json` - C:\Users\<USERNAME>\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
  ```powershell
  # Admin only!
  # Be sure that target path exist!!!

  Remove-Item "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"; `
  New-Item -ItemType SymbolicLink `
    -Path "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" `
    -Target "$env:DOTFILES\powershell\settings.json"
  ```
- `Microsoft.PowerShell_profile.ps1` - C:\Users\<USERNAME>\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
  ```powershell
  # Admin only!

  Remove-Item "$PROFILE"; `
  New-Item -ItemType SymbolicLink `
    -Path "$PROFILE" `
    -Target "$env:DOTFILES\powershell\Microsoft.PowerShell_profile.ps1"
  ```
