# Prompt
update_PS1 () {
    PS1="\[$(tput bold)\]\[\033[38;5;2m\]\u@\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;14m\]\w\[$(tput sgr0)\] at \[$(tput sgr0)\]\[\033[38;5;5m\]\t\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;3m\]$(__git_ps1 " [%s]")\[$(tput sgr0)\] >"
}
shopt -u promptvars
PROMPT_COMMAND=update_PS1