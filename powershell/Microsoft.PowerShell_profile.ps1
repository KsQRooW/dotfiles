oh-my-posh init pwsh --config "$env:DOTFILES/oh-my-posh/ksq_kanagawa.omp.json" | Invoke-Expression

# functions (like aliases)
function lg { lazygit }
function cdd { cd D:\dotfiles }
function todo { nvim D:\dotfiles\notes\todo.md }
function activate { ./venv/Scripts/activate.ps1 }
function install-dudes { uv pip install debugpy pytest-language-server mypy ruff black deptry }
