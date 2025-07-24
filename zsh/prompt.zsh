# Load version control information
autoload -Uz vcs_info
precmd() {
	vcs_info
	AWSPROFILE=""
	if [ "$AWS_DEFAULT_PROFILE" != "default" ]; then
		AWSPROFILE="$AWS_DEFAULT_PROFILE"
	fi

}

# Format the vcs_info_msg_0 variable
zstyle ':vcs_info:git:*' formats ' ⎇ [%b]'
setopt PROMPT_SUBST

#%n username %m hostname to the first . %d current directory %* time, %F and %f set/end foreground colour

# user@machine:cwd at timestamp gitbranch aws
# PROMPT='%F{green}%B%n@%m%f%b%F{white}:%f%F{cyan}%B%~%b%f at %F{magenta}%*%f%F{yellow}${vcs_info_msg_0_}%f %F{yellow}${AWSPROFILE}%f>'

# timestamp user@machine:cwd gitbranch aws
# PROMPT='%F{magenta}%*%f %F{green}%B%n@%m%f%b%F{white}:%f%F{cyan}%B%~%b%f%F{yellow}${vcs_info_msg_0_}%f %F{yellow}${AWSPROFILE}%f>'

# timestamp user@machine current and parent directory gitbranch aws
# Use actual username
PROMPT='%F{magenta}%*%f %F{green}%B%n@%m%f%b%F{white} %f%F{cyan}%B%2d%b%f%F{yellow}${vcs_info_msg_0_}%f %F{yellow}${AWSPROFILE}%f>'

export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export EDITOR=nano;

AWS_DEFAULT_PROFILE=""
