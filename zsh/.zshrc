#!/bin/zsh

# # # prompt # # #
_reset_color='%f'
_cherry_pastele_color='%F{#d27e99}'       # rgb(210, 126, 153)
_red_pastele_color='%F{#ff5d62}'          # rgb(255, 93, 98)
_purple_pastele_color='%F{#938aa9}'       # rgb(147, 138, 169)
_green_pastele_color='%F{#6a9589}'        # rgb(106, 149, 137)
_yellow_pastele_color='%F{#e6c384}'       # rgb(230, 195, 132)
_lite_yellow_pastele_color='%F{#dcd7ba}'  # rgb(220, 215, 186)

_splitter="${_lite_yellow_pastele_color} -> ${_reset_color}"

parse_virtualenv() {
    if [ -n "$VIRTUAL_ENV" ]; then
        python_path="${VIRTUAL_ENV}/bin/python"
        venv="$(${python_path} -V | grep -oE "[^ ]+$")"
    else
        venv=''
    fi
    [ -n "$venv" ] && echo "${_splitter}${_yellow_pastele_color}${venv}${_reset_color}"
}

parse_venv_creator() {
    if [ -n "$VIRTUAL_ENV" ]; then
        dirname=$(basename "$VIRTUAL_ENV")
        pyvenv_cfg="$VIRTUAL_ENV/pyvenv.cfg"
        if [ ! -f "$pyvenv_cfg" ]; then
            venv_type='venv'
        elif grep -qE 'uv[[:space:]]*=*' "$pyvenv_cfg"; then
            venv_type='uv'
        elif grep -qE 'virtualenv[[:space:]]*=*' "$pyvenv_cfg"; then
            venv_type='virtualenv'
        else
            venv_type='venv'
        fi
    else
        venv_type=''
    fi
    [ -n "$venv_type" ] && echo "${_splitter}${_purple_pastele_color}${dirname} by ${venv_type}${_reset_color}"
}

parse_git_branch() {
    branch=$(git branch --show-current 2> /dev/null)
    [ -n "$branch" ] && echo "${_splitter}${_green_pastele_color}${branch}${_reset_color}"
}

parse_last_command_exit_code() {
    last_command_exit_code="$?"
    [ "${last_command_exit_code}" != 0 ] && echo "${_splitter}${_red_pastele_color}exit: ${last_command_exit_code}${_reset_color}"
}

if [ "$(id -u)" = 0 ]; then
    emoji=😎️
else
    emoji=🌊 # 🐸🦋
fi

export VIRTUAL_ENV_DISABLE_PROMPT=1
setopt PROMPT_SUBST

build_prompt() {
  last_command_status=$(parse_last_command_exit_code)
  dir="${_cherry_pastele_color}%~${_reset_color}"
  python_info=$(parse_virtualenv)
  venv_creator=$(parse_venv_creator)
  git_branch=$(parse_git_branch)

  echo $'\n'"╭─ ${emoji} ${dir}${python_info}${venv_creator}${git_branch}${last_command_status}"$'\n'"╰─ "
}

PROMPT='$(build_prompt)'


# # # television # # #

eval "$(tv init zsh)"

# # # # # # # # # # # #

# # # aliases # # #

alias ls='ls --color -A'
alias root='sudo -s'
alias activate='source ./venv/bin/activate'
alias cdd="cd $DOTFILES"
alias lazygit='~/go/bin/lazygit'
alias lg='~/go/bin/lazygit'
alias todo="nvim $HOME/dotfiles/notes/todo.md"

# dotfiles path
export DOTFILES="$HOME/dotfiles"

# path to lazygit config
export LG_CONFIG_FILE="$HOME/dotfiles/lazygit/config.yml"

# # # # # # # # # #

# shellcheck source=/dev/null
. "$HOME/dotfiles/zsh/zsh-autosuggestions-0.7.1/zsh-autosuggestions.zsh"
. "$HOME/dotfiles/zsh/zsh-syntax-highlighting-0.8.0/zsh-syntax-highlighting.zsh"
