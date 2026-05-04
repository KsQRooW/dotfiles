#!/bin/sh

# # # prompt # # #
_reset_color='\033[0m'
# _cherry_pastele_color='\033[38;5;175m'               # rgb(210, 126, 153) 175 - rgb(215, 135, 175)
_cherry_pastele_color='\033[0;38;2;210;126;153m'       # rgb(210, 126, 153) 175 - rgb(215, 135, 175)
# _red_pastele_color='\033[38;5;203m'                  # rgb(255, 93, 98)   203 - rgb(255, 95, 95)
_red_pastele_color='\033[0;38;2;255;93;98m'            # rgb(255, 93, 98)   203 - rgb(255, 95, 95)
# _purple_pastele_color='\033[38;5;103m'               # rgb(147, 138, 169) 103 - rgb(135,135,175)
_purple_pastele_color='\033[0;38;2;147;138;169m'       # rgb(147, 138, 169) 103 - rgb(135,135,175)
# _green_pastele_color='\033[38;5;72m'                 # rgb(106, 149, 137) 72  - rgb(95,175,135)
_green_pastele_color='\033[0;38;2;106;149;137m'        # rgb(106, 149, 137) 72  - rgb(95,175,135)
# _yellow_pastele_color='\033[38;5;222m'               # rgb(230, 195, 132) 222 - rgb(255,215,135)
_yellow_pastele_color='\033[0;38;2;230;195;132m'       # rgb(230, 195, 132) 222 - rgb(255,215,135)
# _lite_yellow_pastele_color='\033[38;5;187m'          # rgb(220, 215, 186) 187 - rgb(215,215,175)
_lite_yellow_pastele_color='\033[0;38;2;220;215;186m'  # rgb(220, 215, 186) 187 - rgb(215,215,175)

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

_dir="${_cherry_pastele_color}\w ${_reset_color}"

build_prompt() {
    last_command_status=$(parse_last_command_exit_code)
    dir="${_cherry_pastele_color}\w${_reset_color}"
    python_info=$(parse_virtualenv)
    venv_creator=$(parse_venv_creator)
    git_branch=$(parse_git_branch)

    PS1="\n╭─ ${emoji} ${dir}${python_info}${venv_creator}${git_branch}${last_command_status}\n╰─ "
}

PROMPT_COMMAND=build_prompt # ╰─ ╭─

# # # television # # #

eval "$(tv init bash)"

# # # # # # # # # # # #

# # # aliases # # #

alias ls='ls --color -A'
alias root='sudo -s'
alias activate='source ./venv/bin/activate'
alias cdd="cd ${DOTFILES}"
alias lazygit='~/go/bin/lazygit'
alias lg='~/go/bin/lazygit'
alias todo="nvim $HOME/dotfiles/notes/todo.md"

# dotfiles path
export DOTFILES="$HOME/dotfiles"

# path to lazygit config
export LG_CONFIG_FILE="$HOME/dotfiles/lazygit/config.yml"
