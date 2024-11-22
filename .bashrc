# ~/.bashrc#
[[ $- == *i* ]] && source ~/.local/share/blesh/ble.sh --noattach

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=nvim
export HISTCONTROL=ignoredups

##### aliases
# ls
alias ls='ls -lah --color=auto'

# Modified commands
alias grep='grep --color=auto'

# pacman aliases
alias pac='pacman -S'   # install
alias pacu='pacman -Syu'    # update, add 'a' to the list of letters to update AUR packages if you use yaourt
alias pacr='pacman -R'   # remove
alias pacs='pacman -Ss'      # search
alias paci='pacman -Si'      # info
alias paclo='pacman -Qdt'    # list orphans
alias pacro='paclo && sudo pacman -Rns $(pacman -Qtdq)' # remove orphans
alias pacc='pacman -Scc'    # clean cache
alias paclf='pacman -Ql'   # list files

# Privileged access
if (( UID != 0 )); then
	alias reboot='sudo systemctl reboot'
	alias poweroff='sudo systemctl poweroff'
fi

PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[38;5;199;3m\]\u\[\e[0m\] \[\e[1m\]@\[\e[0m\] \[\e[1m\]\h\[\e[0m\] \[\e[2;3m\]in\[\e[0m\] \[\e[38;5;35;1m\]\w\[\e[0m\] \[\e[93;1m\]${PS1_CMD1}\n\[\e[39m\]>\[\e[0m\] '

[[ ! ${BLE_VERSION-} ]] || ble-attach

# Created by `pipx` on 2024-11-22 01:22:52
export PATH="$PATH:/home/alek/.local/bin"
