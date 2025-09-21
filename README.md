# Commands

- Создание переменных окружения
  ```powershell
  [System.Environment]::SetEnvironmentVariable("DOTFILES", "D:\dotfiles", "User")
  [System.Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME", "D:\dotfiles", "User")
  ```

# Git

- link to hooks:
  - `git config --global core.hooksPath "D:/dotfiles/git/hooks"`

# NeoVim

- nvim-treesitter
  - gcc for windows - https://www.equation.com/servlet/equation.cmd?fa=fortran
- telescope.nvim
  - `winget install sharkdp.fd`
  - `winget install BurntSushi.ripgrep.MSVC`
- mason.nvim and some lsp stuff
  - nodejs - `winget install OpenJS.NodeJS`
- lazygit.nvim
  - `winget install -e --id=JesseDuffield.lazygit`

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
