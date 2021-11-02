# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0 variable
zstyle ':vcs_info:git:*' formats ' ⎇ [%b]'
setopt PROMPT_SUBST

#%n username %m hostname to the first . %d current directory %* time, %F and %f set/end foreground colour
PROMPT='%F{green}%B%n@%m%f%b%F{white}:%f%F{cyan}%B%~%b%f at %F{magenta}%*%f%F{yellow}${vcs_info_msg_0_}%f >'
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

function utility(){
	cd /Users/joel/.utility
}

function reload(){
    source /Users/joel/.zshrc
}

function edit(){
	code /Users/joel/.zshrc
	code /Users/joel/.utility/*.zsh
}

function ascii(){
	  echo $1 | tr -d "\n" | od -An -t dC
}

function count(){
	echo -n "$1" | wc -m
}

function words(){
	echo -n "$1" | wc -w
}

function d2x(){
	echo "ibase=10; obase=16; $1" | bc
}

function x2d(){
	echo "ibase=10; obase=16; $1" | bc
}

function b2d(){
	echo "ibase=2; obase=10; $1" | bc
}

function d2b(){
	echo "ibase=10; obase=2; $1" | bc
}

function x2b(){
	echo "ibase=16; obase=2; $1" | bc
}

function b2x(){
	echo "$((2#$1))"
}

function b2d(){
	printf '%x\n' "$((2#$1))"
}

# Add Decimal to ASCII
# Add Hex to ASCII
# Add bitwise operations (AND, OR, XOR etc)