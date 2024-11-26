# ~/.bashrc#
[[ $- == *i* ]] && source ~/.local/share/blesh/ble.sh --noattach

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=vim
export HISTCONTROL=ignoredups
export MANPAGER='vim -M +MANPAGER - '
export SUDO_PROMPT="$(tput setaf 1 bold)Password:$(tput sgr0) "
# Created by `pipx` on 2024-11-22 01:22:52
export PATH="$PATH:/home/alek/.local/bin"

shopt -s autocd

##### aliases
# ls
alias la='ls -lah --color=auto'

# Modified commands
alias grep='grep --color=auto'

# pacman aliases
alias pacs='pacman -Ss'      # search
alias paci='pacman -Si'      # info
alias paclo='pacman -Qdt'    # list orphans
alias pacro='paclo && sudo pacman -Rns $(pacman -Qtdq)' # remove orphans
alias paclf='pacman -Ql'   # list files
alias pacq='pacman -Qs'     # search pkg

# Privileged access
if (( UID != 0 )); then
	alias reboot='sudo systemctl reboot'
	alias poweroff='sudo systemctl poweroff'
    alias pac='sudo pacman -S'   # install
    alias pacu='sudo pacman -Syu'    # update
    alias pacr='sudo pacman -Rs'   # remove pkg and dependencies not required by other pkgs
    alias pacc='pacman -Scc'    # clean cache
fi

PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[38;5;199;3m\]\u\[\e[0m\] \[\e[1m\]@\[\e[0m\] \[\e[1m\]\h\[\e[0m\] \[\e[2;3m\]in\[\e[0m\] \[\e[38;5;35;1m\]\w\[\e[0m\] \[\e[93;1m\]${PS1_CMD1}\n\[\e[39m\]>\[\e[0m\] '

[[ ! ${BLE_VERSION-} ]] || ble-attach

